#!/usr/bin/perl 

#W zadanym drzewie katalogów znalezć dowiązania symboliczne wskazujące na pliki regularne, zmodyfikowane nie wczesniej niz 5 minut temu i nie pózniej niz 1 minute temu, do których właściciel ma prawo zapisu. Wyniki posortować.

use File::Find;

die "Uzycie: $0 KATALOG\n" if @ARGV < 1;


die "argument nie jest katalogiem.\n" unless  -d $ARGV[0] ;


$sciezka = $ARGV[0];

find(\&funkcja,$sciezka);

@sorted = sort @tab;

foreach $tab (@sorted)
{
	print $tab;
}	

 
sub funkcja
{    

	if( -l $_ )
	{
		my $link = readlink($_);
		if( -f $link )
		{
			my $prawa = (stat($_))[2];  
		       	my $czas = (stat(_))[9];      
		      	$czas = (time() - $czas);

			 #S_IWUSR      00200   owner has write permission
			if(($prawa & 0200) && $czas>=60 && $czas>=300)
			{
				#print "$_\n";  
				push (@tab , $link);
			}
		}
		
	}
}
