`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    reg [23:0] counter;
    
    // បំបាត់ Warning-UNUSEDSIGNAL
    wire _unused = &{ui_in, uio_in, ena, 1'b0};

    // ភ្ជាប់ LED
    assign uo_out[0] = counter[23];
    
    // បិទជើងផ្សេងៗ
    assign uo_out[7:1] = 7'b0;
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    always @(posedge clk) begin
        if (!rst_n) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

endmodule
// (ត្រូវប្រាកដថាមានបន្ទាត់ទទេនៅទីនេះ)