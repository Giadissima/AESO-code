module FA_2bit(output rout, output [1:0] z, input rin, input [1:0] a, input [1:0] b);
  wire rips; // il riporto dopo la somma cambia su FA1
  FA FA0 (rips, z[0], rin, a[0], b[0]);
  FA FA1 (rout, z[1], rips, a[1], b[1]);
endmodule