#!/usr/bin/perl
# vim:fileencoding=utf-8

$dest_url = "http://img.vim-cn.com/";
push @cmd,("-F",'name=@'.$_) foreach @ARGV;
unshift @cmd,("curl", $dest_url);
open STDOUT,">>","/var/log/lord/el.log"; # Make sure you have its write privilege.
system @cmd;
