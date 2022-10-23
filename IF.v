module IF(clk,IDpcSrc,Stall,IDPC,nextPC,instruction);
input clk,IDpcSrc,Stall;
input [31:0]IDPC;
output [31:0] nextPC,instruction;
reg[31:0] PC;
reg[31:0] nextPC,instruction;
reg [7:0]InsMem[2047:0];
integer j;
integer i;
initial
begin
    PC=0;
    $readmemb("A_bin.txt",InsMem); 
    nextPC=32'b100;
end
always@(posedge clk)
begin
if(!Stall)begin
    instruction=0;
    if(IDpcSrc)begin
    PC=IDPC; 
    end
    for (i = PC; i < PC+4; i = i + 1) begin
    instruction=(instruction<<8)+InsMem[i]; end  
    PC=PC+32'b00000000000000000000000000000100;
    nextPC=PC;        
end
end
endmodule
