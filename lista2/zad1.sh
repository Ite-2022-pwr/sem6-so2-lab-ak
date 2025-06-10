#!/bin/bash
# 4. W zadanym katalogu ($1) znajdź dowiązania symboliczne do obiektów w tym samym katalogu $1 
# i usuń je.

directory=$1
directory=$(echo -n $directory | sed 's/\/$//')

for file in "$directory/"*; do
  if [[ -L $file && "$(readlink -f $file)" == "$PWD/$directory/"* ]]; then
    echo "Deleting $file"
    rm $file
  fi
done

