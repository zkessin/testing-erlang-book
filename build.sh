#!/bin/bash

mkdir -p html
for chapter in `ls *.asciidoc`
do
    chapter_name="${chapter%.*}"
    asciidoc --backend=html4 --out-file=html/$chapter_name.html $chapter
done
cp html/book.html html/index.html
