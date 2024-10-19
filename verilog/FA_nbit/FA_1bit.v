module FA(output rout, output z, input rin, input a, input b);
  assign 
    rout = (a && b) || (b&&rin) || (a&&rin);
  assign 
    z = (!a && !b && rin) || (!a && b && !rin) || (a && !b && !rin) || (a && b && rin);
endmodule