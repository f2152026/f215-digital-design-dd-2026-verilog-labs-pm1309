// tb.v
// Testbench for dut.v. This file is given -- do not modify it.
// Works unchanged regardless of which implementation is currently active
// inside dut.v. The waveform filename (vcd_file) is supplied externally
// via the vcd plusarg -- you don't need to choose or specify one.
// tb.v - Testbench for Task 4
`timescale 1ns/1ps

module tb;

  reg  [63:0] t_a;
  reg  [63:0] t_b;
  reg         t_cin;
  wire [63:0] t_sum;
  wire        t_cout;

  // Instantiate the Device Under Test
  dut uut (
    .a   (t_a),
    .b   (t_b),
    .cin (t_cin),
    .sum (t_sum),
    .cout(t_cout)
  );

  initial begin
    // Vector 1
    t_a = 64'h00000000075bcd15; t_b = 64'h000000003ade68b1; t_cin = 0;
    #30;
    $display("a=%h b=%h cin=%b | sum=%h cout=%b", t_a, t_b, t_cin, t_sum, t_cout);

    // Vector 2 (Worst-case ripple)
    t_a = 64'hFFFFFFFF_FFFFFFFF; t_b = 64'd1; t_cin = 0;
    #30;
    $display("a=%h b=%h cin=%b | sum=%h cout=%b", t_a, t_b, t_cin, t_sum, t_cout);

    // Vector 3
    t_a = 64'h0F0F0F0F_0F0F0F0F; t_b = 64'hF0F0F0F0_F0F0F0F0; t_cin = 1;
    #30;
    $display("a=%h b=%h cin=%b | sum=%h cout=%b", t_a, t_b, t_cin, t_sum, t_cout);

    // Vector 4
    t_a = 64'd123456789; t_b = 64'd987654321; t_cin = 0;
    #30;
    $display("a=%h b=%h cin=%b | sum=%h cout=%b", t_a, t_b, t_cin, t_sum, t_cout);

    #30;
    $finish;
  end

endmodule
