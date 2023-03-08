class scoreboard;
  
  transaction trans;
  mailbox mon2scb;
static int err_count; 
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    
    begin
      trans = new();
    
      mon2scb.get(trans);
     //trans.display("SCORE BOARD");
     // @(trans.In or trans.enable or trans.out)
	//begin

      if (!trans.enable) 
        begin
          if(trans.out ==8'd0)
            $display("RESULT IS AS EXPECTED");
          else if (trans.out != 8'd0)
            $display("ERROR");
        end
          else
            
            case (trans.In)
              3'b000: begin if(trans.out == 8'b00000001)
                $display ("RESULT IS AS EXPECTED");
                else begin
                  $display("ERROR");
			err_count++;
              end
end
              3'b001: begin if(trans.out == 8'b00000010)
                $display ("RESULT IS AS EXPECTED");
                else begin
                  $display("ERROR");
			err_count++;
              end
end
              3'b010: begin if(trans.out == 8'b00000100)
                $display ("RESULT IS AS EXPECTED");
                 else begin
                  $display("ERROR");
			err_count++;
              end
end
              3'b011: begin if(trans.out == 8'b00001000)
                $display ("RESULT IS AS EXPECTED");
                else
                  $display("ERROR");
              end
              3'b100: begin if(trans.out == 8'b00010000)
                $display ("RESULT IS AS EXPECTED");
                else begin
                  $display("ERROR");
			err_count++;
              end
end
              3'b101: begin if(trans.out == 8'b00100000)
                $display ("RESULT IS AS EXPECTED");
                 else begin
                  $display("ERROR");
			err_count++;
              end
end
              3'b110: begin if(trans.out == 8'b01000000)
                $display ("RESULT IS AS EXPECTED");
                 else begin
                  $display("ERROR");
			err_count++;
              end
end
              3'b111: begin if(trans.out == 8'b10000000)
                $display ("RESULT IS AS EXPECTED");
                else begin
                  $display("ERROR");
			err_count++;
              end
end
              default: $display("default case");
          endcase
      end
      trans.display("SCORE BOARD");
    //end
    if(err_count == 0)
 $display("TEST PASSED");
else 
$display("TEST FAILED");
      endtask
      endclass
//end of score board file
//added on 6-03-2023
