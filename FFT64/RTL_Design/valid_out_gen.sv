module valid_out_gen #(
    parameter FRAME_SIZE = 64
)(
    input  wire clk,
    input  wire rst_n,
    input  wire start,       // trigger signal from stage3
    output reg  valid_out,   // asserted during output window
    output reg [$clog2(FRAME_SIZE)-1:0] count,
    output reg  frame_done   // pulse after FRAME_SIZE outputs
);

    reg active;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            valid_out  <= 1'b0;
            frame_done <= 1'b0;
            count      <= {($clog2(FRAME_SIZE)){1'b0}};
            active     <= 1'b0;
        end else begin
            frame_done <= 1'b0; // default low every cycle

            if (start && !active) begin
                // Start of new frame
                valid_out <= 1'b1;
                active    <= 1'b1;
                count     <= 0;
            end else if (active) begin
                if (count == FRAME_SIZE-1) begin
                    // Last output in this frame
                    valid_out  <= 1'b0;
                    frame_done <= 1'b1; // pulse for 1 cycle
                    active     <= 1'b0; // ready for next frame
                    count      <= 0;
                end else begin
                    count <= count + 1'b1;
                end
            end
        end
    end

endmodule
