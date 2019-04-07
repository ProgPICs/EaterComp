// Auto/manual clock with manual pulse debounce
// Antonio Sanchez
module clock
  (input system_clock,
   input cont_enable,
   input manual_pulse,
   input halt,
   output out_clock
  );
  
  reg [7:0] debounce;
  wire pulse;
  assign pulse=(debounce==8'HFF)?1:(debounce==8'H00)?0:pulse;
  assign out_clock=halt & ((system_clock & cont_enable)  | pulse);
  
  always @(posedge system_clock)
  debounce<=debounce+((manual_pulse)?(debounce<8'HFF)?8'H01:8'H00:(debounce>8'H00)?8'HFF:8'H00);
  
 
endmodule