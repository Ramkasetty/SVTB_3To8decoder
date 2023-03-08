class driver;
  transaction trans;
  mailbox gen2drv;
  virtual intf vif;
  
  
  function new(virtual intf vif,mailbox gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction
  
  task main();
    begin
     // trans = new();
      gen2drv.get(trans);
      
      vif.In <= trans.In;
      vif.enable <= trans.enable;
    //  trans.out <= vif.out;
      
    end
    trans.display("DRIVER");
  endtask
endclass

