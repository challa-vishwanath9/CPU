module IDEX(clk,instructionIDstall,rd1,rd2,signEx,MemRead,MemToReg,MemWrite,RegWrite,writeReg,AluCtrl,
            instructionEX,EXread1,EXread2,EXsignEx,EXMemRead,EXMemToReg,EXMemWrite,EXRegWrite,EXwriteReg,EXAluCtrl);
input clk,MemRead,MemToReg,MemWrite,RegWrite;
input[4:0]writeReg;
input[3:0]AluCtrl;
input [31:0]instructionIDstall,rd1,rd2,signEx;
output EXMemRead,EXMemToReg,EXMemWrite,EXRegWrite;
output[4:0]EXwriteReg;
output[3:0]EXAluCtrl;
output[31:0]instructionEX,EXread1,EXread2,EXsignEx;
reg EXMemRead,EXMemToReg,EXMemWrite,EXRegWrite;
reg [4:0]EXwriteReg;
reg [3:0]EXAluCtrl;
reg [31:0]instructionEX,EXread1,EXread2,EXsignEx;
initial 
begin
    instructionEX=32'b0;
end
always@(posedge clk) begin
    EXMemRead<= MemRead ;
    EXMemToReg<=MemToReg ;
    EXMemWrite<=MemWrite ;
    EXRegWrite<=RegWrite ;
    EXwriteReg<=writeReg ;
    EXAluCtrl<=AluCtrl ;
    instructionEX<=instructionIDstall ;
    EXread1<=rd1 ;
    EXread2<=rd2 ;
    EXsignEx<=signEx;
end
endmodule