module tripple_impl (
    A,
    B,
    C,
    X
);
    input A;
    input B;
    input C;
    output X;

    wire D;
    wire E;
    assign D = A & B;
    assign E = ~D;
    
    assign X = E | C;

endmodule
