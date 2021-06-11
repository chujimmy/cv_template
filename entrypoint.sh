#!/bin/bash

find . -regextype sed -regex ".*/cv/lang/[a-z]\{2\}/cv.tex" | while read fname; do
  latexmk -C -cd $fname
  # Could use -interaction=batchmode which seems intended for automated scripts?
  latexmk -pdf -pvc -file-line-error -view=none -interaction=nonstopmode -recorder -cd $fname > /proc/1/fd/1 2>/proc/1/fd/2 &
done

find . -regextype sed -regex ".*/letter/lang/[a-z]\{2\}/letter.tex" | while read fname; do
  latexmk -C -cd $fname
  # Could use -interaction=batchmode which seems intended for automated scripts?
  latexmk -pdf -pvc -file-line-error -view=none -interaction=nonstopmode -recorder -cd $fname > /proc/1/fd/1 2>/proc/1/fd/2 &
done

tail -f /dev/null
