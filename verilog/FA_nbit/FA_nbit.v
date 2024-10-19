module FA_nbit(output rout, output [N-1:0] z, input rin, input [N-1:0] a, input [N-1:0] b);
  parameter N = 2; // inserisco un valore di default nel caso non sia stato passato il parmetro
  wire [N-1:0] rips; // il riporto dopo la somma cambia su FA1
  FA primo (rips[0], z[0], rin, a[0], b[0]);
  genvar i; // specifico che la i deve far parte di un for generativo
  generate // for generativo = significa che sto creando un numero parametrico di componenti
    for (i = 1; i<N-1; i=i+1) begin
      FA fa (rips[i], z[i], rips[i-1], a[i], b[i]);
    end
  endgenerate
  FA ultimo (rout, z[N-1], rips[N-2], a[N-1], b[N-1]);
endmodule