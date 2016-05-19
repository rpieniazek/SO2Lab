#!/usr/bin/perl 

#W zadanym pliku tekstowym "zamienić" wszystkie daty postaci RRRR.MM.DD na postać MM/DD/RR.


die "Uzycie: $0 plik\n" if @ARGV < 1;


die "argument nie jest plikiem.\n" unless  -f $ARGV[0] ;



open(PLIK , "$ARGV[0]") || die "Nie mozna otworzyć pliku" ;
 
while($linia = <PLIK> )
{
   $linia =~ s|[0-9]{2}([0-9]{2})\.([0-9]{2})\.([0-9]{2})| $2/$3/$1 |g;
   print $linia ;
}

close(PLIK);
