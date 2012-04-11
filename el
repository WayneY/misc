#!/usr/bin/perl
# vim:fileencoding=utf-8

$dest_url = "http://img.vim-cn.com/";
push @cmd,("-F",'name=@'.$_) foreach @ARGV;
unshift @cmd,("curl", $dest_url);
open STDOUT,">>","/var/log/mylord/el.log";
system @cmd;