module top(
  input wire [7:0] io_in,
  output wire [7:0] out
);
   wire 	    rdy = 1;
   wire 	    vld;
   user_module counter0(io_in[0], io_in[1], rdy, out, vld);
endmodule
