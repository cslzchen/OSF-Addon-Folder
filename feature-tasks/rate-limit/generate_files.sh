#! /bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"
cd ./files

for n in {1..16384}; do
    dd if=/dev/urandom of=file\_$( printf %05d "$n" ) bs=1 count=$(( RANDOM / 1024 + 8 ))
done

cd ..
