#!/usr/bin/perl
use 5.016;

my %hash;
open IN,'<',pop @ARGV;
my $key;
my $value;
while(<IN>){
    chomp;
    if(/CREATE TABLE "KS"\."(\w+)"/){
        $key = $1;
        $value = '';
    }
    $value .= $_."\n";
    $hash{$key} = $value;
}
close IN;

open IN,'<',pop @ARGV;
while(<IN>){
    chomp;
    if(/(prompt (\w+)\.\.\.)/){
        say $1;
        say "Creaet table $2(";
        say $hash{uc $2};
    }
}
close IN;
