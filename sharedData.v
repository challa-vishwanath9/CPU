module sharedData();
wire IDpcSrc,Stall,WBRegWrite;
wire[4:0]WBWriteReg,WBiWriteReg;
wire[31:0] IDPC,WBwriteData,instructionID,nextPCIF,nextPCID,
instructionIDstall,instructionEX,instructionDM,instructionMEM,instructionWB,instructionIF;
wire[31:0] nextPC,rd1,rd2,signEx;
wire WBiRegWrite;
wire RegDest,MemRead,MemToReg,MemWrite,RegWrite;
wire [4:0] writeReg;
wire [3:0] AluCtrl;
wire[31:0] EXRead1,EXRead2,EXsignEx,ALUres;
wire zero;
wire EXMemRead,EXMemToReg,EXMemWrite,EXRegWrite;
wire [4:0] EXwriteReg;
wire [3:0] EXAluCtrl;
wire [31:0] ALUresDM,DMRead2,DMReadData;
wire DMMemRead,DMMemToReg,DMMemWrite,DMRegWrite;
wire [4:0] DMwriteReg;
wire  WBMemRead,WBMemToReg,WBMemWrite;
wire [31:0] WBReadData,WBAluRes;
endmodule