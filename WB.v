module WB(clk,WBMemToReg,WBReadData,WBAluRes,WBiWriteReg,WBiRegWrite,
            WBWriteReg,WBRegWrite,WBwriteData);
    input clk,WBMemToReg,WBiRegWrite;
    input[31:0] WBAluRes,WBReadData;
    input[4:0] WBiWriteReg;
    output [4:0]WBWriteReg;
    output [31:0]WBwriteData;
    output WBRegWrite; 
    reg [4:0]WBWriteReg;
    reg [31:0]WBwriteData;
    reg WBRegWrite;    
    initial
    begin
    WBWriteReg=5'b0;
    WBwriteData=32'b0;
    WBRegWrite=1'b0;
    end     
    always@(posedge clk)
    begin
        WBWriteReg<=WBiWriteReg;
        WBRegWrite<=WBiRegWrite;
        WBwriteData<=(WBMemToReg)?WBReadData:WBAluRes;
    end
endmodule