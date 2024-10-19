module MUX_2INnbit (output [N-1:0] z, input [N-1:0] x0, input [N-1:0] x1, input s);
  parameter N = 2;
  genvar i;
  generate
    for (i = 0; i < N; i=i+1) begin
      MUX_1bit mux (z[i], x0[i], x1[i], s);
    end
  endgenerate
endmodule