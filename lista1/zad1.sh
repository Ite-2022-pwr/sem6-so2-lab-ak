#!/bin/bash
# Porównanie zawartości zadanego katalogu z listą plików (nazwa katalogu i pliku z listą zadawana
# w argumentach skryptu). Należy wygenerować listę plików brakujących w katalogu i takich, które
# nie są na liście

dir=$1
dir_files=$(ls $dir | sort -u)
file_list=$(cat $2 | sort -u)

for f in $(ls dir | sort -u); do
  if [[ ! $file_list =~ "$f" ]]; then
    echo "$f"
  fi
done

for f in $file_list; do
  if [[ ! $dir_files =~ "$f" ]]; then
    echo "$f"
  fi
done
