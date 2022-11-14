module top(
  input wire [7:0] io_in,
  output wire [7:0] out
);
   wire 	    rdy = 1;
   wire 	    vld;
   __counter__Counter_0_next counter0(io_in[0], io_in[1], rdy, out, vld);
endmodule
