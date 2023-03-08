class monitor;
   transaction trans;
  mailbox mon2scb;
  virtual intf vif;
covergroup decoder_cov;
		
		In_cp:coverpoint vif.In{
			bins In0 = {0};
          bins In1 = {1};
          bins In2 = {2};
          bins In3 = {3};
          bins In4 = {4};
          bins In5 = {5};
          bins In6 = {6};
          bins In7 = {7};
			
		}

		enable_cp:coverpoint vif.enable{
			bins enable0 = {0};
			bins enable1 = {1};
		}

			

		sel_X_b:cross In_cp,enable_cp{
          bins valid = binsof(In_cp) && binsof(enable_cp.enable1);
         // ignore_bins invaild = binsof(In_cp.In1) && binsof(enable_cp.enable1) ||binsof(In_cp.In1) && binsof(enable_cp.enable0)  ;
illegal_bins inval = binsof(In_cp.In1) && binsof(enable_cp.enable1) ||binsof(In_cp.In1) && binsof(enable_cp.enable0)  ;

		}
	endgroup
  
  
  function new(virtual intf vif,mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
decoder_cov=new();
  endfunction
  
  task main();
    #3
    begin
      trans = new();
      
      trans.In = vif.In;
      trans.enable = vif.enable;
      trans.out = vif.out;
decoder_cov.sample();
      
      mon2scb.put(trans);
      
      trans.display("MONITOR");
      
    end
  endtask
  
endclass


