//nothing to comment

module decoder3to8(enable,In,out);

  input [2:0] In; 
input enable;
  output [7:0] out; 

  reg [7:0] out; 

  always @(enable,In) 
begin

  if(enable == 1'b0)   
        out = 8'b00000000; 
    else
      begin
      if (In == 3'b000) 
            out = 8'b00000001; 
  if (In == 3'b001) 
            out = 8'b00000010; 
  if (In == 3'b010) 
            out = 8'b00000100; 
  if (In == 3'b011) 
            out = 8'b00001000; 
  if (In == 3'b100) 
            out = 8'b00010000; 
  if (In == 3'b101) 
            out = 8'b00100000; 
  if (In == 3'b110) 
            out = 8'b01000000; 
  if (In == 3'b111) 
            out = 8'b10000000; 
  
      end
     end

endmodule


























