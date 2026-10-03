module butterfly_unit #(parameter DATA_WIDTH=16, FIFO_DEPTH = 4) (
    input  wire                         en,
    input  wire signed [DATA_WIDTH-1:0] a_r, a_i,
    input  wire signed [DATA_WIDTH-1:0] b_r, b_i,
    output wire signed [DATA_WIDTH-1:0] sum_r, sum_i,
    output wire signed [DATA_WIDTH-1:0] diff_r, diff_i
);


reg  signed [DATA_WIDTH:0] inter_sum_r, inter_sum_i;
reg  signed [DATA_WIDTH:0] inter_diff_r, inter_diff_i;
wire signed [DATA_WIDTH:0] sum_r_tmp, sum_i_tmp, diff_r_tmp, diff_i_tmp;


always @(*) begin
    if(en) begin
        inter_sum_r  = a_r + b_r;
        inter_sum_i  = a_i + b_i;
        inter_diff_r = a_r - b_r;
        inter_diff_i = a_i - b_i;
    end
    else begin
        inter_sum_r  = 0;
        inter_sum_i  = 0;
        inter_diff_r = 0;
        inter_diff_i = 0;
    end
end


assign sum_r_tmp  = (FIFO_DEPTH == 1 || FIFO_DEPTH == 4 || FIFO_DEPTH == 16) ? (inter_sum_r >>> 1)  : ((inter_sum_r >>> 1)  <<< 1);
assign sum_i_tmp  = (FIFO_DEPTH == 1 || FIFO_DEPTH == 4 || FIFO_DEPTH == 16) ? (inter_sum_i >>> 1)  : ((inter_sum_i >>> 1)  <<< 1);
assign diff_r_tmp = (FIFO_DEPTH == 1 || FIFO_DEPTH == 4 || FIFO_DEPTH == 16) ? (inter_diff_r >>> 1) : ((inter_diff_r >>> 1) <<< 1);
assign diff_i_tmp = (FIFO_DEPTH == 1 || FIFO_DEPTH == 4 || FIFO_DEPTH == 16) ? (inter_diff_i >>> 1) : ((inter_diff_i >>> 1) <<< 1);


assign sum_r  = sum_r_tmp[DATA_WIDTH-1:0];
assign sum_i  = sum_i_tmp[DATA_WIDTH-1:0];
assign diff_r = diff_r_tmp[DATA_WIDTH-1:0];
assign diff_i = diff_i_tmp[DATA_WIDTH-1:0];



endmodule
