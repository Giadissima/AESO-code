module main;
  parameter N = 2;
  reg [N-1:0] x0;
  reg [N-1:0] x1;
  reg s;

  wire [N-1:0] z;
  MUX_2INnbit mux (z,x0,x1,s);
  integer i;
  integer nfor=(N*2)+1;

  initial begin

    $dumpfile("test_mux.vcd");
    $dumpvars;

    x0=0;
    x1=0;
    s=0;
    $display ("(s x0 x1) => z");
    for (i = 0; i < 2**nfor ; i = i+1) begin
      #2 {s, x0, x1} = i;
      #1 $display ("(%b %b %b) => %b", s, x0, x1, z);
    end
  end
endmodule