#!/usr/bin/perl
use 5.010;
use Encode;
use Data::Dumper;

while(<>){
    chomp;
    &reorder($_);
}


sub reorder{
my $order_no_origin;
my $value;
my %hash;
my @list;
our $filename = shift @_;
open IN,'<',"$filename.index.txt";
binmode(IN,":encoding(utf16)");
while(<IN>){
    chomp;
    if(/#### (\d+) ####/){
        $order_no_origin = $1;
    }
    elsif(/\w+/){
        $hash{$order_no_origin} = [$_,join('',reverse (split //,$_))];
    }
}
close IN;

open IN,'<',"$filename.txt";
binmode(IN,":encoding(utf16)");
my $key=0;
while(<IN>){
    chomp;
    if(/#### (\d+) ####/){
        $hash{$key} = [$hash{$key},$value];
        $key = $1;
        $value = '';
    }
    else{
        $value .= $_;
    }
}
$hash{$key} = [$hash{$key},$value];
close IN;

for(1..$key){
    push @list, [$hash{$_}[0][1],$hash{$_}[0][0],$hash{$_}[1]];
}

@list = sort { $a->[0] cmp $b->[0]} @list;
#@list = sort { $a->[0] <=> $b->[0]} @list;

#say Dumper @list;

&wirte(@list);

}

sub wirte{
    my $num = 1;
    open OUT1,'>',"$filename.index.txt.new";
    open OUT2,'>',"$filename.txt.new";
    binmode(OUT2,":encoding(utf16)");
    binmode(OUT1,":encoding(utf16)");
    foreach(@_){
        say OUT1 "#### $num ####";
        say OUT2 "#### $num ####";
        say OUT1 $_->[1];
        say OUT2 $_->[2];
        say OUT1 "";
        say OUT2 "";
        $num ++;
    }
}
