module rotator #(
    parameter DATA_WIDTH = 12, 
    parameter FIFO_DEPTH = 4
)(
    input  wire                                  rot_en,
    input  wire        [$clog2(FIFO_DEPTH)-1:0]  twiddle_sel, 
    input  wire signed [DATA_WIDTH-1:0]          in_r,
    input  wire signed [DATA_WIDTH-1:0]          in_i,
    output wire signed [DATA_WIDTH-1:0]          out_r,
    output wire signed [DATA_WIDTH-1:0]          out_i
);

    // -----------------------------------------------------
    // Twiddle factors for 64-pt DIF FFT (Q2.10, 12-bit signed)
    // Wk = exp(-j*2*pi*k/64), k=0..31
    // -----------------------------------------------------

    localparam signed [DATA_WIDTH-1:0] W_RE [0:31] = '{
        12'h400, 12'h3FB, 12'h3EC, 12'h3D4,
        12'h3B2, 12'h387, 12'h353, 12'h318,
        12'h2D4, 12'h28A, 12'h239, 12'h1E3,
        12'h188, 12'h129, 12'h0C8, 12'h064,
        12'h000, 12'hF9C, 12'hF38, 12'hED7,
        12'hE78, 12'hE1D, 12'hDC7, 12'hD76,
        12'hD2C, 12'hCE8, 12'hCAD, 12'hC79,
        12'hC4E, 12'hC2C, 12'hC14, 12'hC05
    };

    localparam signed [DATA_WIDTH-1:0] W_IM [0:31] = '{
        12'h000, 12'hF9C, 12'hF38, 12'hED7,
        12'hE78, 12'hE1D, 12'hDC7, 12'hD76,
        12'hD2C, 12'hCE8, 12'hCAD, 12'hC79,
        12'hC4E, 12'hC2C, 12'hC14, 12'hC05,
        12'hC00, 12'hC05, 12'hC14, 12'hC2C,
        12'hC4E, 12'hC79, 12'hCAD, 12'hCE8,
        12'hD2C, 12'hD76, 12'hDC7, 12'hE1D,
        12'hE78, 12'hED7, 12'hF38, 12'hF9C
    };

    // Internal multiplication results
    reg signed [2*DATA_WIDTH-1:0] mult_rr, mult_ii, mult_ri, mult_ir;
    reg signed [DATA_WIDTH-1:0]   mult_out_r, mult_out_i;

    always @(*) begin
        mult_rr = in_r * W_RE[twiddle_sel * (32/FIFO_DEPTH)];
        mult_ii = in_i * W_IM[twiddle_sel * (32/FIFO_DEPTH)];
        mult_ri = in_r * W_IM[twiddle_sel * (32/FIFO_DEPTH)];
        mult_ir = in_i * W_RE[twiddle_sel * (32/FIFO_DEPTH)];
        mult_out_r = (mult_rr - mult_ii) >>> 10;
        mult_out_i = (mult_ri + mult_ir) >>> 10;
    end

    // bypass if rot_en=0
    assign out_r = rot_en ? mult_out_r : in_r; 
    assign out_i = rot_en ? mult_out_i : in_i; 

endmodule
