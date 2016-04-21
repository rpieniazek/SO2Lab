#W zadanym pliku tekstowym (parametr) znaleźć daty o postaci rrrr-mm-dd i zastąpić je datami angielskimi np 6th of April, 2013 tylko znaczace cyfry

#!/bin/bash

if [ $# -ne 1 ] 
then
	echo "Niepoprawna iloæ argumentów"
	exit 1
fi

if [ ! -f $1 ]
then
	echo "Podany argument nie jest plikiem!"
	exit 1
fi

LC_LANG=C
LC_ALL=C
cat $1 | gawk '
{
	while(match($0, /([0-9]{1,4})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])/, tab)){

	#1 rrrr
	#2 mm
	#3 dd
	
	#zamiana numeru miesiąca na nazwe	
	switch (tab[2]) {
		case "01":
			tab[2] = "Jan"
		break
		case "02":
			tab[2] = "Feb"
		break
		case "03":
			tab[2] = "Mar"
		break
		case "04":
			tab[2] = "Apr"
		break
		case "05":
			tab[2] = "May"
		break
		case "06":
			tab[2] = "Jun"
		break
		case "07":
			tab[2] = "Jul"
		break
		case "08":
			tab[2] = "Agt"
		break
		case "09":
			tab[2] = "Sept"
		break
		case "10":
			tab[2] = "Oct"
		break
		case "11":
			tab[2] = "Nov"
		break
		case "12":
			tab[2] = "Dec"
		break
	} 

	if(substr(tab[3],0,1) == "0"){
		
		tab[3] = substr(tab[3],2,3)
	}


	# zmiana sufiksu dnia miesiaca
	# 
	switch(tab[3]){
		case "01":
			wynik = tab[3]"st of " tab[2]  "," tab[1] 
		break
		case "02":
			wynik = tab[3]"nd of " tab[2]  "," tab[1] 
		break
		case "03":
			wynik = tab[3]"rd of " tab[2]  "," tab[1] 
		break
		default:
			wynik = tab[3] "th of " tab[2]  "," tab[1] 
		
	}
	
	
	gsub(tab[0], wynik, $0)	
	}
	print $0


}'
