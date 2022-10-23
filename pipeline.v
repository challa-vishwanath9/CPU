`include "IF.v"
`include "IFID.v"
`include "DATASTALL.v"
`include "ID.v"
`include "IDEX.v"
`include "EX.v"
`include "EXDM.v"
`include "MEM.v"
`include "MEMWB.v"
`include "WB.v"
`include "sharedData.v"
module pipeline(clk);
input clk;
sharedData sd();
IF IF1(clk,sd.IDpcSrc,sd.Stall,sd.IDPC,sd.nextPC,sd.instructionIF);

IFID IFID1(clk,sd.instructionIF,sd.nextPCIF,sd.instructionID,sd.nextPCID,sd.Stall);

//datastall datastall1(clk,RSID,RTID,opcode,sd.instructionID,sd.instructionEX,sd.instructionMEM,writeReg,RegWrite,sd.instructionWB,sd.Stall);
datastall datstall1(clk,sd.instructionID[25:21],sd.instructionID[20:16],sd.instructionID[31:26],sd.instructionID,sd.instructionEX,sd.instructionMEM,sd.WBiWriteReg,sd.WBiRegWrite,sd.instructionWB,sd.Stall,sd.instructionIDstall);
ID ID1(clk,sd.nextPCID,sd.instructionIDstall,sd.WBWriteReg,sd.WBwriteData,sd.WBRegWrite,sd.rd1,sd.rd2,sd.signEx,
            sd.RegDest,sd.MemRead,sd.MemToReg,sd.MemWrite,sd.RegWrite,sd.writeReg,sd.AluCtrl,sd.IDPC,sd.IDpcSrc);

IDEX IDEX1(clk,sd.instructionIDstall,sd.rd1,sd.rd2,sd.signEx,sd.MemRead,sd.MemToReg,sd.MemWrite,sd.RegWrite,sd.writeReg,sd.AluCtrl,
            sd.instructionEX,sd.EXRead1,sd.EXRead2,sd.EXsignEx,sd.EXMemRead,sd.EXMemToReg,sd.EXMemWrite,sd.EXRegWrite,sd.EXwriteReg,sd.EXAluCtrl);

EX EX1(clk,sd.EXRead1,sd.EXsignEx,sd.EXAluCtrl,sd.ALUres,sd.zero);

EXDM EXDM1(clk,sd.instructionEX,sd.ALUres,sd.EXMemRead,sd.EXMemToReg,sd.EXMemWrite,sd.EXRegWrite,sd.EXwriteReg,sd.EXRead2,
            sd.instructionDM,sd.ALUresDM,sd.DMMemRead,sd.DMMemToReg,sd.DMMemWrite,sd.DMRegWrite,sd.DMwriteReg,sd.DMRead2);

MEM MEM1(clk,sd.ALUresDM,sd.DMRead2,sd.DMMemRead,sd.DMMemWrite,sd.DMReadData);

MEMWB MEMWB1(clk,sd.instructionDM,sd.DMMemRead,DMMemWrite,sd.DMMemToReg,DMRegWrite,sd.DMwriteReg,sd.DMReadData,sd.ALUresDM,
            sd.instructionWB,sd.WBMemRead,sd.WBMemWrite,sd.WBMemToReg,sd.WBiRegWrite,sd.WBiWriteReg,sd.WBReadData,sd.WBAluRes);

WB WB1(clk,sd.WBMemToReg,sd.WBReadData,sd.WBAluRes,sd.WBiWriteReg,sd.WBiRegWrite,
            sd.WBWriteReg,sd.WBRegWrite,sd.WBwriteData);

endmodule