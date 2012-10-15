#!/bin/sh
set -e

# Check that a pdf is passed as input.
pdf="$1"
! test -f "$pdf" && echo 'Specify a pdf file to be converted to svg.' && exit 1

# Select the directory.
if [ "$2" = '' ] && echo "$2" | grep -v -e '.pdf$' > /dev/null; then
  d=$(basename "$pdf" .pdf)
elif [ "$2" = '' ] ; then
  d=$"$pdf"2svg
else
  d="$2"
fi

# Check that it's available
test -e "$d" &&
  echo "The directory ${d} already exists; remove it or specify a different output directory." &&
  exit 1

(
  cd $d
  ln -s 
)
echo inkscape -zl "$pdf"
