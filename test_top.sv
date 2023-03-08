`include "3to8decoder.sv"
`include "interface.sv"
`include "test.sv"
//`include "transaction.sv";
module test_top;
  intf int_f();
 test testb(int_f);
  
  decoder3to8 DUT (.enable(int_f.enable),.In(int_f.In),.out(int_f.out));
  
  /* initial begin
  $dumpfile("dump.vcd"); $dumpvars;
  end
*/

initial begin
    $shm_open("waves.shm");
    $shm_probe("ACMTF");
end
  
endmodule


