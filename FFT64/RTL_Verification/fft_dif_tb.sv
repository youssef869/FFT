`timescale 1ns/1ps

module fft_dif_tb;

    // Parameters
    localparam DATA_WIDTH = 12;
    localparam CLK_PERIOD = 10;   // 100 MHz clock
    localparam N = 64;             // FFT size
    localparam NUM_TESTS = 50;    // Number of test cases

    // DUT signals
    reg clk, rst_n, valid_in;
    reg signed  [DATA_WIDTH-1:0] in_r, in_i;
    wire signed [DATA_WIDTH-1:0] out_r, out_i;
    wire                         valid_out;

    real out_r_q, out_i_q;
    reg signed [DATA_WIDTH-1:0] real_in_mem [0:NUM_TESTS*N-1];
    reg signed [DATA_WIDTH-1:0] imag_in_mem [0:NUM_TESTS*N-1];
    reg signed [DATA_WIDTH-1:0] real_out_golden [0:NUM_TESTS*N-1];
    reg signed [DATA_WIDTH-1:0] imag_out_golden [0:NUM_TESTS*N-1];


    // DUT instance
    fft64_dif #(.DATA_WIDTH(DATA_WIDTH)) dut (
        .clk(clk),
        .rst_n(rst_n),
        .valid_in(valid_in),
        .in_r(in_r),
        .in_i(in_i),
        .out_r(out_r),
        .out_i(out_i),
        .valid_out(valid_out)
    );

    // Clock generation
    always #(CLK_PERIOD/2) clk = ~clk;

    // Load test vectors
    initial begin
        $readmemb("real_input.txt", real_in_mem);
        $readmemb("imag_input.txt", imag_in_mem);
        $readmemb("real_output.txt", real_out_golden);
        $readmemb("imag_output.txt", imag_out_golden);
    end

    // Main stimulus
    integer t;
    initial begin
        initialize();
        reset();

        for (t = 0; t < NUM_TESTS; t = t + 1) begin
            run_testcase(t);
            check_output(t);
        end
        
        $display("********************** All testcases completed **********************.");
        $stop;
    end

    // Initialize signals
    task initialize;
    begin
        clk      = 0;
        valid_in = 0;
        in_r     = 0;
        in_i     = 0;
    end
    endtask

    // Apply reset
    task reset;
    begin
        rst_n = 0;
        #(2*CLK_PERIOD);
        rst_n = 1;
    end
    endtask

    // Apply test input from memory
    task run_testcase;
        input integer t;
        integer base;
        integer i;
    begin
        base = t * N;
        @(negedge clk);
        valid_in <= 1;
        for (i = 0; i < N; i = i + 1) begin
            in_r <= real_in_mem[base+i];
            in_i <= imag_in_mem[base+i];
            @(negedge clk);
        end
        valid_in <= 0;
        in_r <= 0; in_i <= 0;
    end
    endtask

    // Check DUT output against golden output
    task check_output;
        input integer t;
        integer base;
        integer k;
        real diff_r, diff_i;
    begin
        base = t * N;
        wait (valid_out);
        $display("===== Testcase %0d =====", t);
        for (k = 0; k < N; k = k + 1) begin
            @(posedge clk);
                $display("index %0d: DUT=%f+%fj, Expected=%f+%fj",
                 k,
                 $itor(out_r) / 32.0, $itor(out_i) / 32.0,
                 $itor(real_out_golden[base+k]) / 32.0, $itor(imag_out_golden[base+k]) / 32.0);

        end
    end
    endtask


    task run_directed_test;
    begin
        @(negedge clk);
        valid_in <= 1; in_r <= 1 <<< 8; in_i <= 0; // 1.0
        @(negedge clk);
        in_r <= 0 <<< 8; in_i <= 0;
        @(negedge clk);
        in_r <= 2 <<< 8; in_i <= 0; // 2.0
        @(negedge clk);
        in_r <= 0 <<< 8; in_i <= 0;
        @(negedge clk);
        in_r <= 3 <<< 8; in_i <= 0; // 3.0
        @(negedge clk);
        in_r <= 0 <<< 8; in_i <= 0;
        @(negedge clk);
        in_r <= 4 <<< 8; in_i <= 0; // 4.0
        @(negedge clk);
        in_r <= 0 <<< 8; in_i <= 0;

        // Deassert valid after inputs
        @(negedge clk);
        valid_in <= 0;
        in_r <= 0; in_i <= 0;
    end
    endtask

endmodule
