#!/bin/bash
# 2. Dla dowolnych dwóch katalogów (argumenty skryptu), zastąp w drugim wszystkie dowiązania 
# twarde, wspólne dla obu katalogów, dowiązaniami symbolicznymi.

dir1=$1
dir2=$2

dir1=$(echo -n $dir1 | sed 's/\/$//')
dir2=$(echo -n $dir2 | sed 's/\/$//')

declare -A inodes

for file in "$dir1/"*; do
  [ -f $file ] || continue
  inode=$(stat -c '%i' $file)
  inodes[$inode]="$file"
done

for file in "$dir2/"*; do
  [ -f $file ] || continue
  inode=$(stat -c '%i' $file)
  if [[ -n "${inodes[$inode]}" ]]; then
    echo "${inodes[$inode]} == $file"
    rm $file
    ln -s "$dir1/${inodes[$inode]}" $file
  fi
done
