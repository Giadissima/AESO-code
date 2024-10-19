module FA(output ripout, output z, input x, input y, input ripin);
    assign
        ripout = y && ripin || x && ripin || x && y;

    assign
        z = !x && !y && ripin  ||   !x && y && !ripin   || x && !y && !ripin  ||   x && y && ripin;
endmodule