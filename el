#!/usr/bin/perl
# vim:fileencoding=utf-8

$dest_url = "http://img.vim-cn.com/";
foreach (@ARGV){
  push @cmd,("-F",'name=@'.$_);
}
unshift @cmd,("curl", $dest_url);
open STDOUT,">>","logfile";
system @cmd;
