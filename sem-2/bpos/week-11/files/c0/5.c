void writedisk(uint ppx, uint spx) {
    int y;
    writems(spx, hdbase + 4*K);
    copyms(ppx*4*K, hdbase, k);
    writems(2, hdbase + 4*K + 4);
    y = 1;
    while y != 0 {
        y = readms(hdbase + 4*K + 4)
    }
};