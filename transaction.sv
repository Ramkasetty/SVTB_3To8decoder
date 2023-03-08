//files to be added to main branch
class transaction;
  rand bit [2:0] In;
  rand bit enable;
  bit [7:0] out;
  
  //constraint dec {enable != 0;}
  
  function void display( string name);
    $display(".......................................................");
    $display("%0s ",name);
    $display("input values are enable = %0b , input = %b ",enable,In);
    $display("output values are out = %b ",out);
    $display(".......................................................");
  endfunction
endclass




















