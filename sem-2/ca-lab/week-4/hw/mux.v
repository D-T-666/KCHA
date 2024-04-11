module mux (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [1:0] sel,
    output wire [3:0] out);

// always @ (a or b or c or d or sel)
// begin
//     if (sel == 0) out = a;
//     else if (sel == 1) out = b;
//     else if (sel == 2) out = c;
//     else if (sel == 3) out = d;
// end

out = (a & ~sel[0] & ~sel[1]) | (b & ~sel[0] & sel[1]) | (c & sel[0] & ~sel[1]) | (d & sel[0] & sel[1]);
// assign out[0] = (a[0] & ~sel[0] & ~sel[1]) | (b[0] & ~sel[0] & sel[1]) | (c[0] & sel[0] & ~sel[1]) | (d[0] & sel[0] & sel[1]);
// assign out[1] = (a[1] & ~sel[0] & ~sel[1]) | (b[1] & ~sel[0] & sel[1]) | (c[1] & sel[0] & ~sel[1]) | (d[1] & sel[0] & sel[1]);
// assign out[2] = (a[2] & ~sel[0] & ~sel[1]) | (b[2] & ~sel[0] & sel[1]) | (c[2] & sel[0] & ~sel[1]) | (d[2] & sel[0] & sel[1]);
// assign out[3] = (a[3] & ~sel[0] & ~sel[1]) | (b[3] & ~sel[0] & sel[1]) | (c[3] & sel[0] & ~sel[1]) | (d[3] & sel[0] & sel[1]);
    
endmodule