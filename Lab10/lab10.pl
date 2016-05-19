#!/usr/bin/perl 
#lab10 W drzewie katalogowm A znaleźć pliki zwykłe, które należą też do drzewa B
#Rafal Pieniazek 209847
use File::Find;
use Cwd 'abs_path';

die "Uzycie: $0 plik\n" if @ARGV < 2;


die "argument 1 nie jest katalogiem.\n" unless  -d $ARGV[0] ;
die "argument 2 nie jest katalogiem.\n" unless  -d $ARGV[1] ;




$secondPath = $ARGV[1];
$secondPath = abs_path($secondPath);

find(\&funkcja,$ARGV[0]);



sub funkcja
{    
   
	if( -f $_ )
	{	
		$firstPath = abs_path($_);
		#print "$firstPath\n";

		if (index($firstPath, $secondPath) == 0) 
		{
		    print "$firstPath\n";
		} 
	}
}
