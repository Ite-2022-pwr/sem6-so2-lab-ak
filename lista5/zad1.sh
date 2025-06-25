#!/bin/bash
# 2. W zadanym katalogu utwórz pliki regularne o nazwach pokrywających się z kolejnymi liniami 
# w zadanym pliku (tworzyć również pliki ze spacjami w nazwie). Jeżeli plik o takiej nazwie już 
# istnieje, to zmień prawa dostępu do niego, usuwając wszystkim prawo do zapisu. Jeżeli obiekt 
# o takiej nazwie istnieje, a nie jest plikiem regularnym, to wyświetl ostrzeżenie 
# i nie zmieniaj go.

file=$1

for line in $(cat $file); do
  if [ -f $line ]; then
    chmod -w $line
  elif [ -a $line ]; then
    echo -e "\e[33mWARNING: $line exists\e[0m"
  else
    touch $line
  fi
done

