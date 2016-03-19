#!/bin/bash
#Rafal Pieniazek 209847
#W zadanym drzewie katalogów wypisać:
#1)dla ukrytych plików zwykłych: nazwę oraz numer i węzła
#2)dla niepustych podkatalogów drzewa: prawa(liczbowe) oraz rozmiar w bajatach

if [ $# -eq 0 ]
then 
	echo "brak argumentow"
	exit 1
fi

if [ ! -d $1 ]
then 
	echo "argument nie jest katalogiem"
	exit 1
fi

find $1 -mindepth 1 -type f -name ".*" -printf "%f %i\n" -or  -type d -not -empty -printf "%m %k\n"







