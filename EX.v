module EX(clk,EXRead1,EXsignEX,AluCtrl,ALUres,zero);
input clk;
input [3:0]AluCtrl;
input [31:0]EXRead1,EXsignEX;
output zero;
output [31:0]ALUres;
wire[3:0] AluCtrl;
wire[31:0]EXRead1,EXsignEX;
reg zero;
reg[31:0]ALUres;
wire clk;
always @(posedge clk,AluCtrl,EXRead1,EXsignEX)
     begin
	 case(AluCtrl)

4'b0010 : ALUres = EXRead1+EXsignEX;	 
4'b0110 : ALUres = EXRead1-EXsignEX;
4'b0000 : ALUres = EXRead1&EXsignEX;
4'b0001 : ALUres = EXRead1|EXsignEX;
4'b0011 : ALUres = EXRead1*EXsignEX;
4'b0101 : ALUres = EXRead1/EXsignEX;
4'b1111 : ALUres = EXRead1^EXsignEX;
4'b0110 : begin

           if(EXRead1 == EXsignEX)
		   begin
		   zero = 1'b1;
		   end
		   else 
		   begin
		   zero = 1'b0;
		   end
          
		 end
default: begin
         ALUres = 32'd0;
		 zero = 0;
         end
endcase
end
endmodule