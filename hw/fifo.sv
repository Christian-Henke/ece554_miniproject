// fifo.sv
// Implements delay buffer (fifo)
// On reset all entries are set to 0
// Shift causes fifo to shift out oldest entry to q, shift in d

module fifo
  #(
  parameter DEPTH=8,
  parameter BITS=64
  )
  (
  input clk,rst_n,en,
  input [BITS-1:0] d,
  output [BITS-1:0] q
  );
  // your RTL code here
  reg [BITS-1:0] state[DEPTH-1:0];   
  genvar gen;

  always_ff @(posedge clk, negedge rst_n) begin
    if (!rst_n || en) begin
      // hardcoded depth of 8
      state[0] <= rst_n ? state[1] : {(BITS){1'b0}};
      state[1] <= rst_n ? state[2] : {(BITS){1'b0}};
      state[2] <= rst_n ? state[3] : {(BITS){1'b0}};
      state[3] <= rst_n ? state[4] : {(BITS){1'b0}};
      state[4] <= rst_n ? state[5] : {(BITS){1'b0}};
      state[5] <= rst_n ? state[6] : {(BITS){1'b0}};
      state[6] <= rst_n ? state[7] : {(BITS){1'b0}};
      state[7] <= rst_n ? d : {(BITS){1'b0}};
    end
  end
  
  assign q = rst_n ? state[0] : {(BITS){1'b0}};

endmodule // fifo
