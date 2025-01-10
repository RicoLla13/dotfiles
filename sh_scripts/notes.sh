#!/bin/sh

file_name="$HOME/dev/personal/notes/note-$(date +%d-%m-%Y).md"

if [ ! -f $file_name ]; then
    echo "# Notes for $(date +%d-%m-%Y)" > $file_name
fi

nvim -c "norm Go" \
    -c "norm Go## $(date +%H:%M)" \
    -c "norm G2o" \
    -c "norm zz" \
    -c "startinsert" $file_name
