module blink_led (
    input clk,    // ចង្វាក់ Clock (Input)
    input reset,  // ប៊ូតុង Reset
    output reg led // ជើង Output ទៅ LED
);
    reg [2:0] counter; // បង្កើតកន្លែងរាប់លេខទំហំ 3-bit (រាប់ពី 0 ដល់ 7)

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            led <= 0;
        end else begin
            if (counter == 7) begin
                counter <= 0;
                led <= ~led; // ប្តូរស្ថានភាព LED (Invert)
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule