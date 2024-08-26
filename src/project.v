/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_ALU (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;
    assign uo_out[7:6] = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};
    arithmetic_unit arithmetic_unit(
        .A[0](ui_in[0]),
        .A[1](ui_in[1]),
        .A[2](ui_in[2]),// 3-bit input A
        .B[0](ui_in[3]),
        .B[1](ui_in[4]),
        .B[2](ui_in[5]), // 3-bit input B
        .sel[0](ui_in[6]),
        .sel[1](ui_in[7]),// 2-bit select signal
        .result[0](uo_out[0]),
        .result[1](uo_out[1]),
        .result[2](uo_out[2]),
        .result[3](uo_out[3]),
        .result[4](uo_out[4]),
        .result[5](uo_out[5]),// 6-bit result (to accommodate multiplication and division)
);

endmodule
