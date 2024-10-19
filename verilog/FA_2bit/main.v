module test;
  reg [1:0] a; // sintassi per dire che a è una tupla e a[0] è il bit più significativo
  reg [1:0] b;
  reg rin;

  wire rout;
  wire [1:0] z;

  integer i;
  FA_2bit adder (rout,z,rin,a,b);

  initial
    begin
      a=0;
      b=0;
      rin=0;

      $dumpfile("test_fa.vcd");
      $dumpvars;

      #1 $display("(a b rin) => (rout z)");

      for(i=0; i<8; i+=1)
        begin
          #2 {a,b,rin}=i;
          #1 $display("(%b %b %b) => (%b %b)", a, b, rin, rout, z);
        end
      $finish;
    end 

endmodule