#!/usr/bin/perl
use 5.016;
use Transfer;

my %hash;
open IN,'<',pop;
my $key;
my $value;
while(<IN>){
    chomp;
    if(/CREATE TABLE "KS"\."(\w+)"/){
        $key = $1;
        $value = '';
    }
    $value .= &Transfer::transfer($_)."\n";
    $hash{$key} = $value;
}
close IN;

open IN,'<',pop;
while(<IN>){
    chomp;
    if(/(prompt (\w+)\.\.\.)/){
        say $1;
        #say "Create table $2";
        say $hash{uc $2};
    }
}
close IN;
