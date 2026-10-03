module fft8_dif #(
    parameter DATA_WIDTH = 12
)(
    input  wire clk, rst_n, valid_in,
    input  wire signed [DATA_WIDTH-1: 0] in_r, in_i,
    output wire signed [DATA_WIDTH-1: 0] out_r, out_i,
    output wire                          valid_out
);

wire signed [DATA_WIDTH-1: 0] stg1_r,stg1_i;
wire signed [DATA_WIDTH-1: 0] stg2_r,stg2_i;
wire signed [DATA_WIDTH-1: 0] stg3_r,stg3_i;

wire stg1_fill_done, stg2_fill_done, stg3_fill_done;
wire frame_done;

wire [2:0] valid_out_count;


fft_sdf_stg #(.FIFO_DEPTH(4), .DATA_WIDTH(DATA_WIDTH)) fft_stg1 (
.clk(clk),
.rst_n(rst_n),
.valid_in(valid_in),
.in_r(in_r),
.in_i(in_i),
.stg_out_r(stg1_r),
.stg_out_i(stg1_i),
.fill_done(stg1_fill_done),
.frame_done(frame_done)
);

fft_sdf_stg #(.FIFO_DEPTH(2), .DATA_WIDTH(DATA_WIDTH)) fft_stg2 (
.clk(clk),
.rst_n(rst_n),
.valid_in(stg1_fill_done),
.in_r(stg1_r),
.in_i(stg1_i),
.stg_out_r(stg2_r),
.stg_out_i(stg2_i),
.fill_done(stg2_fill_done),
.frame_done(frame_done)
);


fft_sdf_stg #(.FIFO_DEPTH(1), .DATA_WIDTH(DATA_WIDTH)) fft_stg3 (
.clk(clk),
.rst_n(rst_n),
.valid_in(stg2_fill_done),
.in_r(stg2_r),
.in_i(stg2_i),
.stg_out_r(out_r),
.stg_out_i(out_i),
.fill_done(stg3_fill_done),
.frame_done(frame_done)
);

// // valid out logic
valid_out_gen valid_gen_u0 (
    .clk(clk),
    .rst_n(rst_n),
    .start(stg3_fill_done),
    .frame_done(frame_done),
    .valid_out(valid_out),
    .count(valid_out_count)
);



endmodule