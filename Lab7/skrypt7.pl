#!/usr/bin/perl
#Rafał Pieniążek
#Złączyc w jeden plik pliki zwykle zadane w pliku listy(parametr). Kolejność łączenia wg listy. Treść każdego pliku poprzedzić nagłówkiem z jego nazwą.

die "Usage: $0 LIST\n" if @ARGV < 1;

open(FILE, $ARGV[0])|| die "Cannot open file";

while($line = <FILE>){
	
	open(CURRENT_FILE,$line);	
	print $line ;
	
	for( <CURRENT_FILE>){
		print;
	}
	print "\n";
	
	close(CURRENT_FILE);	
}
close(FILE);

