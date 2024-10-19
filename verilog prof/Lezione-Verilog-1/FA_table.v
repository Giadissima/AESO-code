primitive FA_somma(output z, input x, input y, input ripin);
    table
        0 0 0 : 0;
        0 0 1 : 1;
        0 1 0 : 1;
        0 1 1 : 0;
        1 0 0 : 1;
        1 0 1 : 0;
        1 1 0 : 0;
        1 1 1 : 1;
    endtable
endprimitive

primitive FA_riporto(output ripout, input x, input y, input ripin);
    table
        0 0 0 : 0;
        0 0 1 : 0;
        0 1 0 : 0;
        0 1 1 : 1;
        1 0 0 : 0;
        1 0 1 : 1;
        1 1 0 : 1;
        1 1 1 : 1;
    endtable
endprimitive

module FA(output ripout, output z, input x, input y,  input ripin);
   FA_riporto m1(ripout, x, y, ripin);
   FA_somma m2(z, x, y, ripin);
endmodule