module main;
  parameter N = 2; // inserisco un valore di default nel caso non sia stato passato il parmetro
  reg [N-1:0] a; // sintassi per dire che a è una tupla e a[0] è il bit più significativo
  reg [N-1:0] b;
  reg rin;

  wire rout;
  wire [N-1:0] z;

  integer i;
  integer nfor= N*3;
  FA_nbit adder (rout,z,rin,a,b);

  initial
    begin
      a=0;
      b=0;
      rin=0;

      $dumpfile("test_fa.vcd");
      $dumpvars;

      #1 $display("(a b rin) => (rout z)");

      for(i=0; i<(2**nfor); i+=1) // bisogna fare la potenza per calcolare tutte le possibili combinazioni di input
        begin
          #2 {a,b,rin}=i;
          #1 $display("(%b %b %b) => (%b %b)", a, b, rin, rout, z);
        end
      $finish;
    end 

endmodule