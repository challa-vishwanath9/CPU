`include "pipeline.v"
module testbech_pip;
integer i;
reg clock;
pipeline Ram(clock);
initial 
begin
  $dumpfile("Sri.vcd");$dumpvars;
end
initial begin
  clock = 0;
  for(i=0;i<500;i++)
  #5 clock=~clock;
  $display("Happy Diwali Folks");
end

endmodule