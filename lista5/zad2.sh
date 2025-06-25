#!/bin/bash
# Trudniejsze (5.2)
# 1. W zadanym katalogu przerób wszystkie dowiązania symboliczne wskazujące na pliki regularne 
# w tym katalogu, na dowiązania twarde.

directory=$1

cd $directory
for file in ./*; do
  if [ -L $file ]; then
    file_path=$(realpath $(readlink $file))
    if [ -f $file_path ];then
      rm $file
      ln $file_path $file 
    fi
  fi
done
cd ..

