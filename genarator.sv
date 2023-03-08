class genarator;
  transaction trans;
  mailbox gen2drv;
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  task main();
    begin 
      trans  = new();
      trans.randomize();
      gen2drv.put(trans);
      
    end
    trans.display("GENERATOR ");
  endtask
endclass

