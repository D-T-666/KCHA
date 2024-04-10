#!/bin/sh

gnuplot $1.gnu

inkscape --actions="select-all;unselect-by-id:rect1;fit-canvas-to-selection;export-id" $1.svg -o $1.svg
# inkscape --actions="select-all;unselect-by-id:rect1;export-id" $1.svg -o $1.svg