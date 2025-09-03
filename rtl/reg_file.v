module reg_file #(
    parameter WIDTH = 32, 
    REG_COUNT = 32
)(
    input clk,          //single bit inputs, so no [count]
    input write_enable, //single bit inputs, so no [count]

    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    input [WIDTH-1:0] wdata,

    output [WIDTH-1:0] rdata1,
    output [WIDTH-1:0] rdata2
);

reg [WIDTH-1:0] registers [REG_COUNT-1:0]; //declaration of actual storage for 32 registers

//Asynchronous Read logic
//if address is 0, output 0, 5'b0 => 5 length binary 0s. output 32 length binary 0s.
assign rdata1 = (raddr == 5'b0) ? 32'b0 : registers[raddr1];
assign rdata2 = (raddr == 5'b0) ? 32'b0 : registers[raddr2];

//Synchronous Write logic, only happens on clock edge
always @(posedge clk) begin
    if (write_enable && (waddr != 5'b0)) begin
        registers[waddr] <= wdata;
    end
end //always is used for sequential logic, assign for combinational

endmodule