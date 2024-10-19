module test;
  reg a,b,rin;
  wire rout, z;

  integer i;
  FA adder (rout,z,rin,a,b);

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