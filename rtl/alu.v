module alu #(parameter WIDTH = 32)(
    input [WIDTH-1:0] op_a,
    input [WIDTH-1:0] op_b,
    input [3:0] alu_op,
    output [WIDTH-1:0] sum
);
assign sum = (alu_op == 4'b0000) ? op_a + op_b : 32'b0;

endmodule
