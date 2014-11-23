module ALU_Control(funct_i, ALUOp_i, ALUCtrl_o);
  input [5:0] funct_i;
  input [1:0] ALUOp_i;
  output [2:0] ALUCtrl_o;
  reg [2:0] ALUCtrl_o;
  //AND  0000 00ss ssst tttt dddd d000 0010 0100	
	//OR   0000 00ss ssst tttt dddd d000 0010 0000
	//ADD  0000 00ss ssst tttt dddd d000 0010 0101
	//SUB  0000 00ss ssst tttt dddd d000 0010 0010
	//MUL  0000 00ss ssst tttt dddd d000 0001 1000
	//ADDI 0010 00ss ssst tttt iiii iiii iiii iiii
  
  always @(funct_i or ALUOp_i) begin
    if(ALUOp_i == 2'b10)begin
      case (funct_i)
        6'b100000: ALUCtrl_o = 3'b010;//ADD
        6'b100010: ALUCtrl_o = 3'b110;//SUB
        6'b100100: ALUCtrl_o = 3'b000;//AND
        6'b100101: ALUCtrl_o = 3'b001;//OR
        6'b011000: ALUCtrl_o = 3'b011;//MUL
      endcase
    end else if(ALUOp_i == 2'b11)begin
      ALUCtrl_o = 3'b010;
    end
  end
endmodule