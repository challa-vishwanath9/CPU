module EXDM(clk,instructionEX,ALUres,EXMemRead,EXMemToReg,EXMemWrite,EXRegWrite,EXwriteReg,EXRead2,
            instructionDM,ALUresDM,DMMemRead,DMMemToReg,DMMemWrite,DMRegWrite,DMwriteReg,DMRead2);
input clk,EXMemRead,EXMemToReg,EXMemWrite,EXRegWrite;
input[31:0]instructionEX,ALUres,EXRead2;
input[4:0]EXwriteReg;
output DMMemRead,DMMemToReg,DMMemWrite,DMRegWrite;
output[31:0]instructionDM,ALUresDM,DMRead2;
output[4:0]DMwriteReg;
reg DMMemRead,DMMemToReg,DMMemWrite,DMRegWrite;
reg[31:0]instructionDM,ALUresDM,DMRead2;
reg[4:0]DMwriteReg;
initial
  begin
   instructionDM=32'b0;
  end
  always @(posedge clk)
    begin
      begin
      
      DMMemRead<=EXMemRead;
      DMMemToReg<=EXMemToReg;
      DMMemWrite<=EXMemWrite;
      DMRegWrite<=EXRegWrite;
     instructionDM<=instructionEX;
     ALUresDM<=ALUres;
    
     DMRead2<=EXRead2;
     DMwriteReg<=EXwriteReg;
      end
    end
endmodule