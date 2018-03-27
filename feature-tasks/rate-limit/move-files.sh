#!/bin/bash

parent_path=$( cd "$( dirname "${BASH_SOURCE[0]}" )" ; pwd -P )

cd "${parent_path}/files"

for folder in {0..127}; do

	sub_dir=$( printf %03d "$folder" )
	echo -ne "Creating directory: $sub_dir"
	rm -rf $sub_dir
	mkdir $sub_dir
	echo "Done"

	base=$((128*$folder))

	for file in {1..128}; do
		file_id=$(($base + $file)) 
		file_name=file\_$( printf %05d "$file_id" )
		sleep 0.01
		echo -ne "Moving file $file_name to $sub_dir ... "
		mv "$file_name" "$sub_dir/$file_name"
		echo "Done"
	done

	sleep 0.1

done

echo "Done"
