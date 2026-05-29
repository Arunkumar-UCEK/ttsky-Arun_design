module full_adder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

assign sum  = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);

endmodule

module carry_save_adder (
    input  [3:0] A,
    input  [3:0] B,
    input  [3:0] C,
    output [4:0] SUM
);

wire [3:0] s;
wire [3:0] carry;

// Stage 1: Carry Save Addition
full_adder FA0 (.a(A[0]), .b(B[0]), .cin(C[0]), .sum(s[0]), .cout(carry[0]));
full_adder FA1 (.a(A[1]), .b(B[1]), .cin(C[1]), .sum(s[1]), .cout(carry[1]));
full_adder FA2 (.a(A[2]), .b(B[2]), .cin(C[2]), .sum(s[2]), .cout(carry[2]));
full_adder FA3 (.a(A[3]), .b(B[3]), .cin(C[3]), .sum(s[3]), .cout(carry[3]));

// Stage 2: Final Carry Propagation
assign SUM = {1'b0, s} + {carry, 1'b0};

endmodule
