module FA_2bit(output ripout, output [1:0]somma, input ripin, input [1:0]x1, input [1:0]x2);
    wire rips;

    FA fa0(rips, somma[0], ripin, x1[0], x2[0]);
    FA fa1(ripout, somma[1], rips, x1[1], x2[1]);
endmodule