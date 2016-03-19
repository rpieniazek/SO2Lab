#!/bin/bash
#Rafal Pieniazek 209847
#Przeniesc wszystkie dowiązania symboliczne w zadanym katalogu(parametr skryptu) do katalogu nadrzednego, tak aby dowiazania wskazywaly dalej na ten sam cel

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



for file in `ls -A $1`
do	
	if [ -L $1/$file ]
	then	
		realPath=`readlink -m $1/$file`
		#echo $realPath
		#echo $absolutePath
		ln -s -f $realPath $1/../${file}
		rm $1/$file
	fi
done






