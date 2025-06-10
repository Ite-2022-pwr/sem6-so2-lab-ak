#!/bin/bash
# Trudniejsze (3.2)
# 1. Skopiować zadane drzewo katalogów w zadane miejsce, uwzględniając pliki regularne, podkatalogi 
# oraz dowiązania symboliczne. Dowiązania symboliczne w kopii powinny wskazywać na pierwotne obiekty.

src=$1
dst=$2

declare -A links

for syml in $(find $src -type l); do
  links["$(basename $syml)"]="$(pwd)/$(dirname $syml)/$(readlink $syml)"
done

# for i in "${!links[@]}"; do echo "${i}: ${links[$i]}"; done

cp -r $src $dst


for syml in $(find $dst -type l); do
  ln -sfn ${links[$(basename $syml)]} $syml
done

tree $dst

