#!/bin/bash

# 3. W zadanym drzewie katalogów znaleźć pliki regularne, do których właściciel nie ma prawa 
# zapisu, ale ktoś inny ma prawo wykonania, zmodyfikowane nie wcześniej niż 5 minut temu i nie 
# później niż $2 (argument skryptu) minut temu.

dir_tree=$1
last_modified_max=$2

find $dir_tree -mmin +5 -mmin -$last_modified_max -type f -perm -o+x ! -perm -u+w

