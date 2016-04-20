#W zadanym pliku tekstowym "Przekszta³ciæ" bibliografiê postaci: imiona nazwisko : tytu³, rok na [rok] nazwisko inicja³y imion tytu³
#Nie zmieniaæ oryginalnego pliku

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
	while(match($0, /(([[:upper:]][[:lower:]]+ )+)(: )(([[:upper:]]|([[:lower:]])+| )+), ([0-9]+)/, tab)){

	#1 - imiona i nazwisko
	#4 - tytu³
	#7 - rok
	#print tab[4]

	n = split(tab[1], a, " ")
	ini = ""
	for(i = 1; i < n; i++){
		var = substr(a[i], 0, 1)
		ini = ini "" var "."
	}
	wynik = "[" tab[7] "]" " " tab[2] "" ini " " tab[4]

	gsub(tab[0], wynik, $0)	
	}
	print $0
}'
