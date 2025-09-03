module cpu(
    input clk,
    input reset
)

endmodule 

wire [31:0] reg_rdata1_wire;
wire [31:0] reg_rdata2_wire;
wire [3:0] alu_op_wire;
wire [31:0] sum_wire;

alu #(.WIDTH(32)) alu1 (
    
    .op_a(reg_rdata1_wire),
    .op_b(reg_rdata2_wire),
    .sum(sum_wire)

);
 
reg_file #(.WIDTH(32) .REG_COUNT(32)) reg_file1 (

    .rdata1(reg_rdata1_wire),
    .rdata2(reg_rdata2_wire),
    .wdata(sum_wire)
);