module IFID(clk,instructionIF,nextPCIF,instructionID,nextPCID,Stall);
input clk,Stall;
input[31:0]instructionIF,nextPCIF;
output[31:0]nextPCID,instructionID;
reg [31:0]nextPCID,instructionID;
initial
begin
   instructionID=32'b0;
end
always@(posedge clk)begin
    //#0.1 delay
    if(!Stall)begin
        nextPCID=nextPCIF;
        instructionID=instructionIF;
    end
end
endmodule