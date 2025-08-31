//verilog module with one 32-bit register at address 0x4000_0000 (in hex its 0100 0000 0000 0000 0000 0000 0000 000)

localparam REG_ADDR = 32*h4000_0000;

module register(
    input wire clk,
    input wire rst,
    input wire write_en,
    input wire [31:0] write_data,
    input wire [31:0] addr,
    output reg [31:0] read_data
);

always @(posedge clk or posedge rst) begin
    if (rst)
        my_reg <= 32'b0;
    else if (write_en && addr == REG_ADDR)
        my_reg <= write_data;
end

always @(*) begin
    if (addr == REG_ADDR)
        read_data = my_reg;
    else
        read_data = 32'b0;
end