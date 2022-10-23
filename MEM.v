module MEM(clk,DMAddress,DMrd2,DMMemRead,DMMemWrite,DMReadData);
input clk,DMMemRead,DMMemWrite;
input[31:0] DMAddress,DMrd2;
output[31:0] DMReadData;
reg[31:0]DMReadData;
reg[31:0]Memory[2047:0];
integer i;
initial begin
    for(i=0;i<2048;i=i+1)
        Memory[i]<=i;
end
always@(posedge clk)
begin
        if(DMMemWrite)
            Memory[DMAddress]<=DMReadData;
        DMReadData<=Memory[DMAddress];        
end
endmodule