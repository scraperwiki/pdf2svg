#!/bin/sh

pdf="$1"

! test -f "$pdf" && echo 'Specify a pdf file to be converted to svg.' && exit 1
