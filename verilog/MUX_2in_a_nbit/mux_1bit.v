module MUX_1bit (output z, input x0, input x1, input s);
  assign 
    z = s ? x1 : x0; // operatore ternario, se il bit di controllo è uno, allora restituisco x1, altrimenti x0
endmodule