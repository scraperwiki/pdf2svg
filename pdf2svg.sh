#!/bin/bash
set -e

# Check that a pdf is passed as input.
pdf="$1"
! test -f "$pdf" && echo 'Specify a pdf file to be converted to svg.' && exit 1

# Select the directory.
if [ "$2" = '' ] ; then
  d="$pdf"2svg
else
  d="$2"
fi

# Check that it's available
test -e "$d" &&
  echo "The directory ${d} already exists; remove it or specify a different output directory." &&
  exit 1

# Create the directory
mkdir -p "$d"
cp "$pdf" "$d/original.pdf"
(
  set -e
  cd "$d"
  pdftk original.pdf burst output .%d.pdf
  for page in .[0-9]*.pdf; do
    number=$(basename $page .pdf | sed 's/^\.//')
    inkscape -zl $number.svg .$number.pdf
  done
)
