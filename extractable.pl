#!/usr/bin/perl
use 5.016;
use Transfer;

my (%hash,$cont);
open IN,'<',shift;
while(<IN>){
    chomp;
    $hash{$1} = 1 if /prompt (\w+)\.\.\./;
}
close IN;

open IN,'<',shift;
while(<IN>){
    chomp;
    $cont = defined $hash{lc $1} ? say "prompt ".lc $1."..." : 0 if /CREATE TABLE "KS"\."(\w+)"/;
    say &Transfer::transfer if $cont == 1;
}
close IN;
