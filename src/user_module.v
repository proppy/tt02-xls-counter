module user_module(
  input wire clk,
  input wire reset,
  input wire user_module__output_producer_rdy,
  output wire [7:0] user_module__output_producer,
  output wire user_module__output_producer_vld
);
  reg [7:0] ____state;
  reg [7:0] __user_module__output_producer_reg;
  reg __user_module__output_producer_valid_reg;
  wire literal_18;
  wire literal_21;
  wire user_module__output_producer_valid_inv;
  wire __user_module__output_producer_vld_buf;
  wire user_module__output_producer_valid_load_en;
  wire user_module__output_producer_load_en;
  wire [7:0] add_14;
  wire pipeline_enable;
  assign literal_18 = 1'h1;
  assign literal_21 = 1'h1;
  assign user_module__output_producer_valid_inv = ~__user_module__output_producer_valid_reg;
  assign __user_module__output_producer_vld_buf = literal_18 & literal_21 & 1'h1;
  assign user_module__output_producer_valid_load_en = user_module__output_producer_rdy | user_module__output_producer_valid_inv;
  assign user_module__output_producer_load_en = __user_module__output_producer_vld_buf & user_module__output_producer_valid_load_en;
  assign add_14 = ____state + 8'h01;
  assign pipeline_enable = literal_21 & literal_18 & user_module__output_producer_load_en & (literal_21 & literal_18 & user_module__output_producer_load_en);
  always @ (posedge clk) begin
    if (reset) begin
      ____state <= 8'h00;
      __user_module__output_producer_reg <= 8'h00;
      __user_module__output_producer_valid_reg <= 1'h0;
    end else begin
      ____state <= pipeline_enable ? add_14 : ____state;
      __user_module__output_producer_reg <= user_module__output_producer_load_en ? ____state : __user_module__output_producer_reg;
      __user_module__output_producer_valid_reg <= user_module__output_producer_valid_load_en ? __user_module__output_producer_vld_buf : __user_module__output_producer_valid_reg;
    end
  end
  assign user_module__output_producer = __user_module__output_producer_reg;
  assign user_module__output_producer_vld = __user_module__output_producer_valid_reg;
endmodule
