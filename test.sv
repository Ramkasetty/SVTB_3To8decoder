`include "environment.sv"

program test(intf int_f);
  environment env;
  initial
    begin
      env = new(int_f);
      env.run();
    end
endprogram 
