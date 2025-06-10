#!/bin/bash
# 1 W zadanym drzewie katalogów wylistować  wszystkie pliki regularne, mające jedno z rozszerzeń 
# o postaci „exe” (wielokrotne rozszerzenia to rozszerzenia, od kropki do kropki lub do końca nazwy, 
# gdy plik ma wiele kropek w nazwie).

DIR=$1

find $DIR -type f | grep -P '.+\.exe(\.|\b)'
