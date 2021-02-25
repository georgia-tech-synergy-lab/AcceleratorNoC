module example_and2 (
	input clk,
	input wire data_a,
	input wire data_b,
	output reg data_o
);

	always @ (posedge clk) begin
		data_o <= data_a & data_b;
	end

endmodule
