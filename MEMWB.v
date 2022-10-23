module MEMWB(clk,instructionDM,DMMemRead,DMMemWrite,DMMemToReg,DMRegWrite,DMWriteReg,DMReadData,DMAluRes,
            instructionWB,WBMemRead,WBMemWrite,WBMemToReg,WBiRegWrite,WBiWriteReg,WBReadData,WBAluRes);
            input clk,DMMemRead,DMMemWrite,DMMemToReg,DMRegWrite;
            input[4:0]DMWriteReg;
            input[31:0] instructionDM,DMReadData,DMAluRes;
            output [31:0]instructionWB,WBReadData,WBAluRes;
            output [4:0]WBiWriteReg;
            output WBMemRead,WBMemWrite,WBMemToReg,WBiRegWrite;
            reg [31:0]instructionWB,WBReadData,WBAluRes;
            reg [4:0]WBiWriteReg;
            reg WBMemRead,WBMemWrite,WBMemToReg,WBiRegWrite;
            wire  clk,DMMemRead,DMMemWrite,DMMemToReg,DMRegWrite;
            wire [4:0]DMWriteReg;
            wire [31:0] instructionDM,DMReadData,DMAluRes;
            initial
            begin
                instructionWB=32'b0;
            end
            always@(posedge clk) begin
                WBMemRead<=DMMemRead ;
                WBMemWrite<=DMMemWrite;
                WBMemToReg<=DMMemToReg ;
                WBiRegWrite<=DMRegWrite;
                WBiWriteReg<=DMWriteReg;
                instructionWB<=instructionDM ;
                WBReadData<=DMReadData ;
                WBAluRes<=DMAluRes ;
            end
endmodule