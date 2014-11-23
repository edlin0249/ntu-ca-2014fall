module CPU
(
    clk_i, 
    rst_i,
    start_i
);

// Ports
input               clk_i;
input               rst_i;
input               start_i;

wire [31:0] inst_addr, inst, SE_i, SEdata2, ALUdata1, ALUdata2;
wire [31:0] RDdata;
wire [4:0] RDaddr;
wire [1:0] ALUOp;
wire ALUSrc, RegWrite, RegDst;

Control Control(
    .Op_i       (inst[31:26]),
    .RegDst_o   (RegDst),
    .ALUOp_o    (ALUOp),
    .ALUSrc_o   (ALUSrc),
    .RegWrite_o (RegWrite)
);

Adder Add_PC(
    .data1_in   (inst_addr),
    .data2_in   (32'd4),
    .data_o     (PC.pc_i)
);


PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (Add_PC.data_o),
    .pc_o       (inst_addr)
);

Instruction_Memory Instruction_Memory(
    .addr_i     (inst_addr), 
    .instr_o    (inst)
);

Registers Registers(
    .clk_i      (clk_i),
    .RSaddr_i   (inst[25:21]),
    .RTaddr_i   (inst[20:16]),
    .RDaddr_i   (RDaddr), 
    .RDdata_i   (RDdata),
    .RegWrite_i (RegWrite), 
    .RSdata_o   (ALUdata1), 
    .RTdata_o   (MUX_ALUSrc.data1_i) 
);


MUX5 MUX_RegDst(
    .data1_i    (inst[20:16]),
    .data2_i    (inst[15:11]),
    .select_i   (RegDst),
    .data_o     (RDaddr)
);

MUX32 MUX_ALUSrc(
    .data1_i    (Registers.RTdata_o),
    .data2_i    (SEdata2),
    .select_i   (ALUSrc),
    .data_o     (ALUdata2)
);

Signed_Extend Signed_Extend(
    .data_i     (inst[15:0]),
    .data_o     (SEdata2)
);

  
ALU ALU(
    .data1_i    (ALUdata1),
    .data2_i    (ALUdata2),
    .ALUCtrl_i  (ALU_Control.ALUCtrl_o),
    .data_o     (RDdata),
    .Zero_o     ()
);


ALU_Control ALU_Control(
    .funct_i    (inst[5:0]),
    .ALUOp_i    (ALUOp),
    .ALUCtrl_o  (ALU.ALUCtrl_i)
);


endmodule

