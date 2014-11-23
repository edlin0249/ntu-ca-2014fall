module ALU(data1_i, data2_i, ALUCtrl_i, data_o, Zero_o);
	input [31:0] data1_i, data2_i;
	input [2:0] ALUCtrl_i;
	output [31:0] data_o;
	output Zero_o;
	reg [31:0] data;
	reg Zero;
	
	assign Zero_o = Zero;
	assign data_o = data;
	
	always@(ALUCtrl_i or data1_i or data2_i) begin
  case(ALUCtrl_i)
    3'b000 : begin
      data = data1_i & data2_i;
    end
    3'b001 : begin
      data = data1_i | data2_i;
    end
    3'b010 : begin
      data = data1_i + data2_i;
    end
    3'b110 : begin
      data = data1_i - data2_i;
    end
    3'b011 : begin
      data = data1_i * data2_i;
    end
    3'b111 : begin
      Zero = (data1_i < data2_i) ? 1'b1 : 1'b0;
    end
    default: begin
      data = 8'h00;
    end
  endcase
  end

endmodule
