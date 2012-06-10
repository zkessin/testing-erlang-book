#!/bin/bash

for chapter in `ls *.txt` 
do 
    asciidoc --backend=html4 --out-file=html/$chapter.html $chapter
done