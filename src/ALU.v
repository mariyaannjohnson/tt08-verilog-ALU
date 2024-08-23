module arithmetic_unit (
    input [2:0] A, // 3-bit input A
    input [2:0] B, // 3-bit input B
    input [1:0] sel, // 2-bit select signal
    output reg [5:0] result // 6-bit result (to accommodate multiplication and division)
);

    // Intermediate signals
    wire [5:0] add_result;
    wire [5:0] sub_result;
    wire [5:0] mul_result;
    wire [5:0] div_result;

    // Addition
    assign add_result = A + B;

    // Subtraction
    assign sub_result = A - B;

    // Multiplication
    assign mul_result = A * B;

    // Division (with zero-check for division by zero)
    assign div_result = (B != 0) ? (A / B) : 6'b0;

    // MUX to select the output based on the sel input
    always @(*) begin
        case (sel)
            2'b00: result = add_result; // Addition
            2'b01: result = sub_result; // Subtraction
            2'b10: result = mul_result; // Multiplication
            2'b11: result = div_result; // Division
            default: result = 6'b0;
        endcase
    end

endmodule
