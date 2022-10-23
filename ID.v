module ID(clk,nextPCID,instructionIDstall,WBwriteReg,WBwriteData,WBRegWrite,rd1,rd2,signEx,RegDest,MemRead,MemToReg,MemWrite,RegWrite,writeReg,AluCtrl,IDPC,IDpcSrc);
input clk,WBRegWrite;
input[31:0]nextPCID,instructionIDstall,WBwriteData;
output [3:0]AluCtrl;
reg [3:0]AluCtrl;
output[4:0]writeReg;
reg[4:0] writeReg;
output[31:0] rd1,rd2,IDPC,signEx;
reg[31:0] rd1,rd2,IDPC,JumpAddr,BranchAddr,signExt,signEx;
input[4:0] WBwriteReg;
output RegDest,MemRead,MemToReg,MemWrite,RegWrite,IDpcSrc;
reg RegDest,MemRead,MemToReg,MemWrite,RegWrite,IDpcSrc,isBranch,isbeq,isbne,Jump;
reg AluSrc;
//regFile
  reg[31:0]Registers[31:0]; 
  integer i;
  initial begin
    Jump=1'b0;
    JumpAddr=32'b0;
    BranchAddr=32'b0;
    signExt=32'b0;
    for( i=0;i<32;i=i+1)
      begin
        Registers[i]<=i;
      end
  end  
always@(posedge clk)
begin
    Jump=1'b0;
    isBranch=1'b0;
    IDpcSrc=1'b0;
if(instructionIDstall==32'b0)
begin
AluCtrl<=4'b0 ;
RegDest<=1'b0;
RegWrite<=1'b0;
AluSrc<=1'b0;
MemRead<=1'b0;
MemWrite<=1'b0;
MemToReg<=1'b0;
isbeq<=1'b0;
isbne<=1'b0;
Jump<=1'b0;
end
else
begin
case(instructionIDstall[31:26])
6'b000000:begin//rtype

RegDest<=1'b1;
RegWrite<=1'b1;
AluSrc<=1'b0;
MemRead<=1'b0;
MemWrite<=1'b0;
MemToReg<=1'b0;
isbeq<=1'b0;
isbne<=1'b0;
Jump<=1'b0;
case(instructionIDstall[5:0])
6'b100000:begin 
AluCtrl<=4'b0010 ;
end
6'b100010:begin
AluCtrl<=4'b0110 ;
end 
6'b011010:begin
AluCtrl<=4'b0101;
end
6'b100101 :begin 
AluCtrl<=4'b0001 ;
end
6'b100110 :begin
AluCtrl<=4'b1111 ;
end
6'b100100:begin
AluCtrl<=4'b0000 ;
end 
endcase 
end

6'b100011:begin//lw

RegDest<=1'b0;
RegWrite<=1'b1;
AluSrc<=1'b1;//
MemRead<=1'b1;
MemWrite<=1'b0;
MemToReg<=1'b1;
isbeq<=1'b0;
isbne<=1'b0;
Jump<=1'b0;
AluCtrl<=4'b0010;
end
6'b101011:begin//sw

RegDest<=1'bx;
RegWrite<=1'b0;
AluSrc<=1'b1;//
MemRead<=1'b0;
MemWrite<=1'b1;
MemToReg<=1'bx;
isbeq<=1'b0;
isbne<=1'b0;
Jump<=1'b0;
AluCtrl<=4'b0010;
end
6'b000010 :begin//jump

RegDest<=1'bx;
RegWrite<=1'b0;
AluSrc<=1'bx;
MemRead<=1'bx;
MemWrite<=1'b0;
MemToReg<=1'bx;
isbeq<=1'bx;
isbne<=1'bx;
Jump<=1'b1;
end
6'b000100:begin//beq

RegDest<=1'bx;
RegWrite<=1'b0;
AluSrc<=1'b0;
MemRead<=1'b0;
MemWrite<=1'b0;
MemToReg<=1'bx;
isbeq<=1'b1;
isbne<=1'b0;
Jump<=1'b0;
AluCtrl<=4'b0110 ;
end
6'b000101:begin//bne
AluCtrl<=4'b0110 ;
RegDest<=1'bx;
RegWrite<=1'b0;
AluSrc<=1'b0;
MemRead<=1'b0;
MemWrite<=1'b0;
MemToReg<=1'bx;
isbne<=1'b1;
isbeq<=1'b0;
Jump<=1'b0;
end
//end
6'b001000:begin//addi
AluCtrl<=4'b0010 ;
RegDest<=1'b0;
RegWrite<=1'b1;
AluSrc<=1'b1;
MemRead<=1'b0;
MemWrite<=1'b0;
MemToReg<=1'b0;
isbeq<=1'b0;
isbne<=1'b0;
Jump<=1'b0;
end
endcase
end
isBranch=isbeq|isbne;
//control unit complete
writeReg=(RegDest==1)?instructionIDstall[15:11]:instructionIDstall[20:16];

rd1<=Registers[instructionIDstall[25:21]];
rd2<=Registers[instructionIDstall[20:16]];

signExt={{16{instructionIDstall[15]}},instructionIDstall[15:0]};
//out={{16{immof[15]}},immof};
signEx=(AluSrc)?signExt:rd2;
BranchAddr=nextPCID+{{16{instructionIDstall[15]}},instructionIDstall[15:0]}-32'b00000000000000000000000000000100;
JumpAddr={{4'b0},{instructionIDstall[25:0]},{2'b0}};

IDPC=(Jump)?JumpAddr:((rd1==rd2)&(isBranch))?BranchAddr:nextPCID;
IDpcSrc=Jump|((isBranch) & (rd1==rd2));

end
always@(negedge clk)begin
    if(WBRegWrite )
    Registers[WBwriteReg]<=WBwriteData;
end
endmodule