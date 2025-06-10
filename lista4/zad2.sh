#!/bin/bash
# 2 W pliku zawierającym program w języku C usunąć wszystkie komentarze postaci 
# //. Uwzględnić możliwość występowania znaków // wewnątrz łańcuchów tekstowych.

PROGRAM=$1

cat $PROGRAM | perl -ne 'chomp; @line = split /("[^"]*")/; for (@line) { $_ =~ s/(.*?)(\/\/.*)/\1/ unless /^"/; } print @line, "\n";'
