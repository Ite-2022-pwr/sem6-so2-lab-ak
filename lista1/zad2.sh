#!/bin/bash
# Listowanie plików z zadanego katalogu (parametr wywołania skryptu), wraz z jego podkatalogami.
# Zawartość podkatalogów ma być listowana w postaci <ścieżka dostępu względem listowanego
# katalogu>/<nazwa pliku>. Ograniczyć liczbę zagnieżdżeń podkatalogów do zadanej liczby
# (parametr wywołania skryptu).

dir=$1
depth=$2

list_dir() {
  local dir_name=$1
  local depth_val=$2

  if [[ $depth_val -le 0 ]]; then
    return
  fi

  for f in "$dir_name"/*; do
    echo $f
    if [[ -d $f ]]; then
      list_dir $f $(( depth_val - 1 ))
    fi
  done
}

list_dir $dir $depth

