`timescale 1ns / 1ns

module sr2jk(
    output q,
    output qbar,
    input j,
    input k,
    input clk
    );
wire x,y;
and a1(x,j,qbar);
and a2(y,k,q);
not a4(qbar,q);

sr_ff a3(q,qbar,y,x,clk);
endmodule

module sr_ff(q,qbar,r,s,clk);
	output q,qbar;
	input r,s,clk;
	reg q,qbar;
	initial begin
	q=1'b0;
	qbar=1'b1;
	end
	always @(posedge clk)
	  begin
	  case({s,r})
		 {1'b0,1'b0}: begin q=q; qbar=qbar; end
		 {1'b0,1'b1}: begin q=1'b0; qbar=1'b1; end
		 {1'b1,1'b0}: begin q=1'b1; qbar=1'b0; end
		 {1'b1,1'b1}: begin q=1'bx; q=1'bx; end
	endcase
	end
endmodule
