#!/bin/bash

TEMP_LOC=$HOME/dev/hearc/templates/qt_start_proj

if [ -d $TEMP_LOC/build ]; then
    rm -rf $TEMP_LOC/build
fi

cp -r $TEMP_LOC .
cd ./qt_start_proj
cmake -S . -B build && cmake --build build
cp ./build/compile_commands.json .
sed -i 's/ -mno-direct-extern-access//g' ./compile_commands.json
rm -rf ./build

if [ $# -ne 0 ]; then
    cd ..
    mv ./qt_start_proj $1
fi
