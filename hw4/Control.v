
module Control(Op_i, RegDst_o, ALUOp_o, ALUSrc_o, RegWrite_o);
	input [5:0]Op_i;
	output [1:0] ALUOp_o;
	output RegDst_o, ALUSrc_o, RegWrite_o;
	reg [1:0] tALUOp_o;
	reg tRegDst_o, tALUSrc_o, tRegWrite_o;
	
  //AND  0000 00ss ssst tttt dddd d000 0010 0100	
	//OR   0000 00ss ssst tttt dddd d000 0010 0000
	//ADD  0000 00ss ssst tttt dddd d000 0010 0101
	//SUB  0000 00ss ssst tttt dddd d000 0010 0010
	//MUL  0000 00ss ssst tttt dddd d000 0001 1000
	//ADDI 0010 00ss ssst tttt iiii iiii iiii iiii
	/*assign ALUOp_o    = (Op_i == 6'b000000)? 2'b10 : 2'b11;
	assign RegDst_o   = (Op_i == 6'b000000)? 1'b1  : 1'b0;
	assign ALUSrc_o   = (Op_i == 6'b000000)? 1'b0  : 1'b1;
	assign RegWrite_o = (Op_i == 6'b000000)? 1'b1  : 1'b1;*/
	assign ALUOp_o    = tALUOp_o;
	assign RegDst_o   = tRegDst_o;
	assign ALUSrc_o   = tALUSrc_o;
	assign RegWrite_o = tRegWrite_o;
	
  always @(Op_i) begin
    if(Op_i == 6'b000000)begin
      tALUOp_o    = 2'b10;
      tRegDst_o   = 1'b1;
      tALUSrc_o   = 1'b0;
      tRegWrite_o = 1'b1;
    end else if(Op_i == 6'b001000)begin
      tALUOp_o    = 2'b11;
      tRegDst_o   = 1'b0;
      tALUSrc_o   = 1'b1;
      tRegWrite_o = 1'b1;
    end else begin
      tALUOp_o    = 2'b11;
      tRegDst_o   = 1'b0;
      tALUSrc_o   = 1'b1;
      tRegWrite_o = 1'b1;
    end
  end
	
endmodule
