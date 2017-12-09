#!/bin/sh

for inp in `find . -regextype ed -regex "^.*/[^_][A-Za-z0-9_\-]\+\.scss$"`
do
    out="../`echo $inp | sed 's/\.scss$/\.css/'`"
    echo -e "\x1b[1mCompiling\x1b[0m $inp \x1b[1mto\x1b[0m $out"

    [ ! -d "`dirname $out`" ] && mkdir "`dirname $out`"
    sassc -m $inp "$out"
done
