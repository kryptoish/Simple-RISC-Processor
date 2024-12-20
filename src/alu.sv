module ALU(Ain, Bin, op, out, status);
	input [1:0] op;
	input [15:0] Ain, Bin;
	output [2:0] status;
	output reg [15:0] out;

	assign status[2] = out[15];
	assign status[1] = (out[15] ^ Ain[15]) & ~(out[15] ^ Bin[15]);
	assign status[0] = (out == 0);

	always_comb case (op)
		2'b00: out = Ain + Bin;
		2'b01: out = Ain - Bin;
		2'b10: out = Ain & Bin;
		2'b11: out = ~Bin;
	endcase
endmodule: ALU
