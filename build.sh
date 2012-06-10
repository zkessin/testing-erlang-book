#!/bin/bash

for chapter in `ls *.doc` 
do 
    asciidoc --backend=html4 --out-file=html/$chapter.html $chapter
done
cp html/book.doc.html html/index.html
