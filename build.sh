#!/bin/bash

for chapter in `ls *.asciidoc` 
do 
    asciidoc --backend=html4 --out-file=html/$chapter.html $chapter
done
cp html/book.asciidoc.html html/index.html
