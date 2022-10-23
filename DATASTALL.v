module datastall(clk,RSID,RTID,opcode,instructionID,instructionEX,instructionMEM,writeReg,RegWrite,instructionWB,stall,instructionIDstall);

input clk,RegWrite;
input [5:0]opcode;
input [4:0]RSID,RTID,writeReg;
input [31:0]instructionID,instructionEX,instructionMEM,instructionWB;

output reg stall;
output [31:0]instructionIDstall;
reg isWvalid1,isWvalid2,isWvalid3;
reg [4:0]isSvalid1,isSvalid2,isSvalid3;
reg isRsValid,isRtValid;
reg [31:0]instructionIDstall;
initial begin
    
stall=1'b0;

isWvalid1=1'b0;
isWvalid2=1'b0;
isWvalid3=1'b0;
isRsValid=1'b0;
isRtValid=1'b0;

end

always @(posedge clk)
begin

if(instructionID != 32'b0)begin
case(opcode)
//RTIDype
6'b0:
begin
isRsValid=1'b1;
isRtValid=1'b1;
end

6'b100011:
begin//lw
isRsValid=1'b1;
isRtValid=1'b0;
end

6'b101011:
begin//sw
isRsValid=1'b1;
isRtValid=1'b1;
end

6'b000010:
begin//jump
isRsValid=1'b0;
isRtValid=1'b0;
end

6'b100:
begin//beq
isRsValid=1'b1;
isRtValid=1'b1;
end

6'b101:
begin//bne
isRsValid=1'b1;
isRtValid=1'b1;
end

default begin//IType
isRsValid=1'b1;
isRtValid=1'b0;

end
endcase

end
else begin
isRsValid=1'b0;
isRtValid=1'b0;
end

//
if(instructionEX != 32'b0)begin
case(instructionEX[31:26])//isWvalid1,isSvalid1
//RTIDype:opcode 6bit and function 
6'b0:
begin
isWvalid1=1'b1;
isSvalid1=instructionEX[15:11];
end
6'b100011:
begin//lw
isWvalid1=1'b1;
isSvalid1=instructionEX[20:16];
end

6'b101011:
begin//sw
isWvalid1=1'b0;
isSvalid1=5'b0;
end

6'b000010:
begin//jump
isWvalid1=1'b0;
isSvalid1=5'b0;
end

6'b100:
begin//beq
isWvalid1=1'b0;
isSvalid1=5'b0;
end

6'b101:
begin//bne
isWvalid1=1'b0;
isSvalid1=5'b0;
end

default 
begin//IType
isWvalid1=1'b1;
isSvalid1=instructionEX[20:16];
end

endcase
end
else begin
isWvalid1=1'b0;
end

//
if(instructionMEM != 32'b0)begin
case(instructionMEM[31:26])//isWvalid2,isSvalid2
//RTIDype:opcode 6bit and function 6bit

6'b0:
begin
isWvalid2=1'b1;
isSvalid2=instructionEX[15:11];
end

6'b100011:
begin//lw
isWvalid2=1'b1;
isSvalid2=instructionEX[20:16];
end

6'b101011:
begin//sw
isWvalid2=1'b0;
isSvalid2=5'b0;
end

6'b000010:
begin//jump
isWvalid2=1'b0;
isSvalid2=5'b0;
end

6'b100:
begin//beq
isWvalid2=1'b0;
isSvalid2=5'b0;
end

6'b101:
begin//bne
isWvalid2=1'b0;
isSvalid2=5'b0;
end

default 
begin//IType
isWvalid2=1'b1;
isSvalid2=instructionEX[20:16];
end

endcase
end

else begin
isWvalid2=1'b0;
end

//
if(instructionWB != 32'b0)begin
isWvalid3=RegWrite;
isSvalid3=writeReg;

end

else begin
isWvalid3=1'b0;
end
if((((RSID==isSvalid1)&isWvalid1))&&isRsValid==1)
begin
  stall = 1'b1;
end
else if((((RSID==isSvalid2)&isWvalid2))&&isRsValid==1)
begin
        stall = 1'b1;
end
else if((((RSID==isSvalid3)&isWvalid3))&&isRsValid==1)
    begin
            stall = 1'b1;
    end
   else if((((RTID==isSvalid1)&isWvalid1))&&isRsValid==1)
    begin
      stall = 1'b1;
    end
    else if((((RTID==isSvalid2)&isWvalid2))&&isRsValid==1)
    begin
            stall = 1'b1;
    end
    else if((((RTID==isSvalid3)&isWvalid3))&&isRsValid==1)
        begin
                stall = 1'b1;
        end
 else
    begin
        stall = 1'b0;
end
if(stall == 0)
begin 
  instructionIDstall = instructionID;
end
else
 begin
    instructionIDstall = 32'b0;
 end
end
endmodule