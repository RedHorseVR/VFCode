#!/usr/bin/perl --


# use 
  $server_dir = "/home/sites/www.flowlynx.com/web/WebFlow" ;
  $webflow_dir = "/";
# prototype definitions
  sub Get_Rec;
  sub Read_Counter;

sub Get_Rec;
sub Read_Counter;

sub LoadFileAsString {
  local ( $file ) = @_;
  local ( $keyfile ) ;
  open( FILE, $file );
  while(<FILE>) {
    s/^ *\n//;
    tr/\t/ /;
    $keyfile = "$keyfile$_";
  }   
  close (SEARCHFILE);  
$keyfile; }
# main
  {
  $cmd_line = $ENV{'QUERY_STRING'} ;
  ($cmd_line) = @ARGV;
  print( STDOUT  " $cmd_line  \n" );
  
} # end