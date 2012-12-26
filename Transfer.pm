package Transfer;

sub transfer{
    s/"//g;
    s/''/' '/g;
    s/CHARACTER/char/g;
    s/DECIMAL/number/g;
    s/VARCHAR/varchar2/g;
    s/(NOT NULL)\s*(DEFAULT .*?)(,?)$/\2 \1\3/g;
    s/KS\.//g;
    $_;
}

1;

__END__
