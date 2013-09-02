#!/usr/bin/perl
use 5.010;
use Encode;
#use Data::Dumper;

while(<>){
    chomp;
    &reorder($_);
}


sub reorder{
    our $filename = shift @_;
    my %hash, $order_no_origin;
    open IN,'<',"$filename.index.txt";
    binmode(IN,":encoding(utf16)");
    while(<IN>){
        chomp;
        if(/#### (\d+) ####/){
            $order_no_origin = $1;
        }
        elsif(/\w+/){
            $hash{$order_no_origin} = [$_, scalar reverse $_];
        }
    }
    close IN;

    open IN,'<',"$filename.txt";
    binmode(IN,":encoding(utf16)");
    my $key, $value;
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

    my @list;
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
    open INDEX,'>',"$filename.index.txt.new";
    open TXT,'>',"$filename.txt.new";
    binmode(TXT,":encoding(utf16)");
    binmode(INDEX,":encoding(utf16)");
    foreach(@_){
        say INDEX "#### $num ####";
        say TXT "#### $num ####";
        say INDEX $_->[1];
        say TXT $_->[2];
        say INDEX "";
        say TXT "";
        $num ++;
    }
}
