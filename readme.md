pdf2svg
========

This shell script uses inkscape to convert a pdf to a directotry of svgs.

    USAGE: pdf2svg [pdf file]

svg files are saved in the `$(basename $pdffilename .pdf)` directory and
are named by page number.
