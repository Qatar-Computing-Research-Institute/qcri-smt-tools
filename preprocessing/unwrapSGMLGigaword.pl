#!/usr/bin/perl
# dump txt from gigaword SGML files
# Francisco Guzman
# (c) Qatar Computing Research Institute, 2012
#

# Usage perl unwrap.pl < file.sgml > file.txt
#
#
binmode(STDIN, ":utf8");
binmode(STDOUT,":utf8");

$title=0;
$p=0;
$date=0;
$tststring="";
$hstring="";
$dstring="";

while(<STDIN>)
{
  if(m/\<HEADLINE\>/)
  {
    $title=1;
    next;
  }

  elsif(m/\<\/HEADLINE\>/)
  {
    $title=0;
    print "$hstring\n";
    $hstring="";
    next;
  }
  elsif(m/\<P\>/)
    {
    $text=1;
    next;
  }
  elsif(m/\<\/P\>/)
  {
    $text=0;
    print "$tstring\n";
    $tstring="";
    next;
  }
  elsif(m/\<DATELINE\>/)
  {
    $date=1;
    next;
  }
  elsif(m/\<\/DATELINE\>/)
  {
    $date=0;
    print "$dstring\n";
    $dstring="";
    next;
  }
  else
  {
    chomp();
    if($title){
      $hstring.=$_." ";
      next;
    }
    elsif($text){
      $tstring.=$_." ";
      next;
    }
    elsif($date){
      $dstring.=$_." ";
      next;
    }
  }
}



