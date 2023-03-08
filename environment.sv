`include "transaction.sv"
`include "genarator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  genarator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  mailbox gen2drv;
  mailbox mon2scb;
  virtual intf vif;
  
  function new(virtual intf vif);
    this.vif = vif;
     
    gen2drv = new();
    mon2scb = new();
    gen = new(gen2drv);
    drv = new(vif,gen2drv);
    mon = new(vif,mon2scb);
    scb = new(mon2scb);
    
  endfunction
  
  task main();
   
      begin
    fork
      gen.main();
      drv.main();
      mon.main();
      scb.main();
    join
end
  endtask
  
  task run();
    repeat(16)
    main();
  //  $finish();
  endtask
  
 
  
endclass



