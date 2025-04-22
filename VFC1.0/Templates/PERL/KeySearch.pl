#!/usr/bin/perl --

#start program
  print "Content-type: text/html\n\n"; 
  $cmd_line = $ENV{'QUERY_STRING'};
  $cmd_line =~ s/\#/_/g;
  $cmd_line =~ s/</_/g;
  $cmd_line =~ s/>/_/g;
  $cmd_line =~ s/\%20/ /g;
  @param = split(/,/, $cmd_line);
  $param[0] =~ s/\W/ /g;
  
  $out = LoadFileAsString( "SearchTemplate.htm" );
  $out =~ s/\$keyname/\"$param[0]\"/g ;
  $out =~ s/\$title/$param[1]/g ;
  print( STDOUT $out );
#end program



# use 
  $server_dir = "/home/sites/www.flowlynx.com/web/WebFlow" ;
  $local_dir = "C:\\Program Files\\Apache Group\\Apache\\htdocs\\eCode\\WebFlow" ;
  $webflow_dir = "/";
# prototype definitions
  sub SendQuery ;
  sub GetMultiPartForm;
  sub Get_Rec;
  sub Read_Counter;
# globals
  local ( @FlowStack );
  $types = "VARIABLE|INPUT|EVENT|PROCESS|SET|OUTPUT|LOOP|LEND|BRANCH|PATH|BEND|END";
  $flowtypes = "input|event|process|set|output|loop|lend|branch|path|bend|end";

$max_files = 100;


sub LoadStubs {
  print( STDOUT  " STUBS ARE LOADED \n" );
  $param{file1} = LoadFileAsString( "JOYTOY.c" );
  $language  =  "c.tok";
  $inline_comment = "\/\/";
  $flowname = "OUT.ins" ;
  $flowpage = "$flowname.html" ;
} 
sub ShowStubs {
  print( STDOUT  " NO STUBS ARE LOADED \n" );
  print( "<pre>$flowname\n" );
  print( "language   : $language   \n" );
  print( "inline_comment    : $inline_comment   \n" );
  print( "flowpage    : $flowpage   \n" );
  print( "flowname   : $flowname  \n" );
  print( "output_path    : $output_path \n" );
} 
sub Old_Main () {
  print( "Content-type: text/html\n\n");
  $param{file1} = "";
  GetMultiPartForm();
  $flowname = "$filename{file1}.ins" ;
  $output_path = "FlowFiles/" ;
  $inline_comment = "\/\/";
  $flowname =~ s/"//g;
  $flowname =~ s/://g;
  $flowname =~ s/\\/_/g;
  $flowname =~ s/\n//g;
  $flowname =~ s/\l//g;
  $flowname =~ s/\r//g;
  $flowpage = "$flowname.html" ;
  $language  =  $param{language };
  $stack_size = push  @FlowStack , "null" ;
  $stack_size = push  @FlowStack , "null" ;
  $stack_size = push  @FlowStack , "null" ;
  
  if ( $param{file1} eq ""  )
  { 
    LoadStubs() ;
    ShowStubs() ;
  } else { 
    
  } 
  LoadVFCTokens( "$language" );
  
  Parse( $param{file1} , "$language" , "$flowname"  );
  
  open( FP ,  ">$output_path$flowpage" )  or die " not opened\n ";
  select( FP );
  
    ShowResults( $flowname    ,  "$language" );
    close( FP ); 
  
  $out = LoadFileAsString( "$output_path$flowpage" );
  $out =~ s/VALUE=\"$flowname\"/VALUE=\"$output_path$flowname\"/ ;
  $out =~ s/open\(\"$flowname\"\)/open\(\"$output_path$flowname\"\)/ ;
  $out =~ s/\.\.\/STDs/STDs/ ;
  print( STDOUT $out );
} # end

$GlobalNextLine = "";
sub Parse {
  local ( $codefile , $tokfile , $flowfile ) = @_;
  $index = 0;
  $codefile =~ tr/\t/ /;
  $keyfile =  LoadFileAsString( $tokfile  );
  open( FP ,  ">$output_path$flowfile" )  ;
  select( FP );
  
  @lines = split(/[\r\n\l]/, $codefile );
  foreach $line (@lines ){
    $lcnt=$index+1;
    $GlobalNextLine="";
    while( $lcnt < $#lines &&  $GlobalNextLine eq "" ) {
      $GlobalNextLine = $lines[$lcnt];
      $GlobalNextLine=~s/^ *//;
      $GlobalNextLine=~s/$inline_comment.*//;
      $lcnt++;
    }
    ScanLine ( $line, $keyfile  );
    $index++;;
    
  } 
  select( STDOUT );
  close( FP );  
} 
sub ShowResults {
  local( $flowname , $language ) = @_;
  open(SEARCHFILE, "WebFlow_Output_Template.htm" );
  $line = "";
  while(<SEARCHFILE>) {  
    $line = $_;  
    $line =~ s/\$titlename/$flowname/g;
    $line =~ s/\$name/$flowname/g;
    $line =~ s/\$language/$language/g;
    print( $line );
  }   
  close (SEARCHFILE);  
} 
sub ProcessKeyCommands {
  $DBSTACK ="";
  local ( $key ) = @_;
  local ( $rtn , $N );
  $rtn = "true";
  if ( $key=~m/\$\|\$/  )
  { 
    @cmd = split(/\$\|\$/, $key);
    $N=0;
    
    foreach $cmd (@cmd){
      while( $cmd && $rtn eq "true" && $N>0 ){
        
        $cmd =~ s/ //g;
        if ( $cmd =~ s/PEEKPUSH// )
        { 
          $value =  $FlowStack[$#FlowStack] ;
          if ( $cmd=~ m/$value/ )
          { 
            $rtn = "";
            $rtn; return;
          } else { 
            $stack_size = push  @FlowStack , $cmd ;
            if($DBSTACK){  print( STDOUT "PEEKPUSH  $cmd ONTO $value ...\n" );}
            if($DBSTACK)
            { 
              $stackvalue = "";
              foreach $FlowStack (@FlowStack){
                $stackvalue =  "$stackvalue | $FlowStack";
              } 
              print( STDOUT "\tstack is: [[$stackvalue]]\n" );
            }else{ 
            } 
          } 
        } else { 
          if ( $cmd =~ s/ONLYPUSH// )
          { 
            $stackvalue = "null";
            foreach $FlowStack (@FlowStack){
              $stackvalue =  "$stackvalue|$FlowStack";
            } 
            if($DBSTACK){ print( STDOUT "ONLYPUSH stack is: $stackvalue\twant to push: $cmd\n" ); }
            if ( $stackvalue=~ m/$cmd/ )
            { 
              $rtn = "";
              $rtn; return;
            } else { 
              $stack_size = push  @FlowStack , $cmd ;
              if($DBSTACK)
              { 
                print( STDOUT "\tPUSH  $cmd  ...\n" );
                $stackvalue = "";
                foreach $FlowStack (@FlowStack){
                  $stackvalue =  "$stackvalue | $FlowStack";
                } 
                print( STDOUT "\tstack is: [[$stackvalue]]\n" );
              }else{ 
              } 
            } 
          }else {
            if (  $cmd =~ s/PUSH// )
            { 
              $stack_size = push  @FlowStack , $cmd ;
              if($DBSTACK){ print( STDOUT "PUSH  $cmd ...\n" ); }
              if($DBSTACK)
              { 
                print( STDOUT "\tPUSH  $cmd  ...\n" );
                $stackvalue = "";
                foreach $FlowStack (@FlowStack){
                  $stackvalue =  "$stackvalue | $FlowStack";
                } 
                print( STDOUT "\tstack is: [[$stackvalue]]\n" );
              }else{ 
              } 
            }else{ 
              if( $cmd =~ s/PEEKPOP//  )
              { 
                $value =  $FlowStack[$#FlowStack] ;
                if($DBSTACK){ print( STDOUT " PEEK...$value want to POP $cmd..." ); }
                if ( $value=~ m/$cmd/ )
                { 
                  $value = pop ( @FlowStack ) ;
                  if($DBSTACK) { print( STDOUT "\tPOP : $value..\n" ); }
                  if($DBSTACK)
                  { 
                    $stackvalue = "";
                    foreach $FlowStack (@FlowStack){
                      $stackvalue =  "$stackvalue | $FlowStack";
                    } 
                    print( STDOUT "\tstack is: [[$stackvalue]]\n" );
                  }else{ 
                  } 
                }else{ 
                  if($DBSTACK){ print( STDOUT "  \n\n" );}
                  $rtn = "";
                  $rtn; return;
                } 
              }else{ 
                if( $cmd =~ s/POPALL//  )
                { 
                  if($DBSTACK){  print( STDOUT " POPALL : $cmd..\n" ); }
                  while( $FlowStack[$#FlowStack] =~ m/$cmd/ ) {
                    $value = pop ( @FlowStack ) ;
                    if($DBSTACK){  print( STDOUT "\t\tPOP : $value..\n" ); }
                    if ( $value =~ s/_//g )
                    { 
                      if ( $flowtypes =~ m/$value/ )
                      { 
                        $value =~ s/branch/bend/;
                        $value =~ s/loop/lend/;
                        $value =~ s/input/end/;
                        if($DBSTACK){  print( STDOUT "\t\tINSERTING COMPLEMENT SYMBOL : $value..\n" ); }
                        $GlobalPoppedStack = "$GlobalPoppedStack $value( );\/\/... INSERTED by a POPALL command\n";
                      } 
                    } 
                  } 
                  if($DBSTACK)
                  { 
                    $stackvalue = "";
                    foreach $FlowStack (@FlowStack){
                      $stackvalue =  "$stackvalue | $FlowStack";
                    } 
                    print( STDOUT "\tstack is: [[$stackvalue]]\n" );
                  }else{ 
                  } 
                }else{ 
                  if( $cmd =~ s/POP//  )
                  { 
                    $value = pop ( @FlowStack ) ;
                    if($DBSTACK){  print( STDOUT " POP : $value..\n" ); }
                    if($DBSTACK)
                    { 
                      $stackvalue = "";
                      foreach $FlowStack (@FlowStack){
                        $stackvalue =  "$stackvalue | $FlowStack";
                      } 
                      print( STDOUT "\tstack is: [[$stackvalue]]\n" );
                    }else{ 
                    } 
                  }else{ 
                    if ($cmd =~ s/PEEKNOT//  )
                    { 
                      $value =  $FlowStack[$#FlowStack] ;
                      if ( $cmd=~ m/$value/ )
                      { 
                        $rtn = "";
                        if($DBSTACK){ print( STDOUT " PEEKNOT: $cmd seeing $value..\n" ); }
                        $rtn; return;
                      }else{ 
                      } 
                    }else{ 
                      if( $cmd =~ s/PEEK//  )
                      { 
                        $value =  $FlowStack[$#FlowStack] ;
                        if ( $cmd=~ m/$value/ )
                        { 
                          if($DBSTACK){ print( STDOUT " PEEK : $value..\n" ); }
                        }else{ 
                          $rtn = "";
                          $rtn; return;
                        } 
                      }else{ 
                        if( $cmd =~ s/NEXTSYMBOLNOT//  )
                        { 
                          if ( $GlobalNextLine=~m/$cmd/  )
                          { 
                            
                            
                            $rtn = "";
                            $rtn; return;
                          }else{ 
                          } 
                        }else{ 
                          if( $cmd =~ s/NEXTSYMBOL//  )
                          { 
                            if ( $GlobalNextLine=~m/$cmd/  )
                            { 
                              
                            }else{ 
                              $rtn = "";
                              $rtn; return;
                            } 
                          }else{ 
                          } 
                        } 
                      } 
                    } 
                  } 
                } 
              } 
            } 
          } 
        } 
        $cmd = "";
      } 
      
      $N++;
    } 
  } else { 
  } 
$rtn; }
sub MatchLine {
  local ( $line, $comment,  $key , $matchcase ) = @_;
  local ( $rtn , $keycopy );
  $rtn = "";
  $line =~ s/^ *//;
  if ( $line eq "" )
  { 
    $rtn;
    return;
  } 
  $keycopy = $key;
  @dkey = split(/\$\|\$/, $key);
  $key = $dkey[0];
  
  if ( $matchcase =~ m/true/ )
  { 
    if ( $line =~ m/$key/  )
    { 
      $rtn = $line;
    }else{ 
    } 
  } else { 
    if ( $line =~ m/$key/i )
    { 
      $rtn = $line;
    }else{ 
    } 
  } 
  if ( $rtn )
  { 
    
    if ( ProcessKeyCommands( $keycopy ) )
    { 
    }else{ 
      
      $rtn = "";
    } 
  } 
$rtn;   }
sub ScanLine {
  local ( $line , $key ) = @_;
  $flowtype = "generic";
  @keys = split(/[\r\n\l]/,$key);
  $line =~ tr[\r\n\l]//;
  $line =~ tr/\r//;
  $line =~ tr/\l//;
  
  foreach $keys (@keys ){
    if ( $keys =~ m/$types/  )
    { 
      $keys =~ s/\[|\]//g;
      $keys =~ tr/[A-Z]/[a-z]/;
      $flowtype = $keys;
      
    }else{ 
      if (  $keys =~ m/^\[/  )
      { 
        $flowtype = $keys;
      }else{ 
      } 
      if ( $flowtype =~ m/$flowtypes/  )
      { 
        ($param, $comment) = split(/$inline_comment/, $line , 2 );
        
        $case = $param{case_sensitive};
        $GlobalPoppedStack = "";
        if ( MatchLine($param , $comment , $keys, $case ) )
        { 
          if ( $last_type eq "branch"  && $flowtype ne "path" )
          { 
            print( "path( );\/\/ AUTO\n" );
          }else{ 
          } 
          print( "$flowtype( $param );\/\/ $comment\n" );
          print( "$GlobalPoppedStack" );
          $last_type = $flowtype;
          return;
        }else{ 
        } 
      }else{ 
      } 
    } 
  } 
  print( "generic( $param );\/\/ $comment \n" );
} 
sub PrintVFCtokens {
  @vfctype = split(/\|/, $flowtypes );
  
  print( "\ntokens for language $language are: \n" );
  foreach $vfctype  (@vfctype  ){
    print( "\n[$vfctype]\n" );
    print( "$VFCtoken{$vfctype}\n" );
  } 
  
} 
sub LoadFileAsString {
  local ( $file , $keyfile ) = @_;
  open( FILE, $file );
  while(<FILE>) {
    s/^ *\n//;
    tr/\t/ /;
    $keyfile = "$keyfile$_";
  }   
  close (SEARCHFILE);  
$keyfile; }
sub LoadVFCTokens {
  local ( $tokfile ) = @_;
  $keyfile =  LoadFileAsString( $tokfile  );
  
  
  @keys = split(/[\r\n\l]/,$keyfile );
  foreach $keys (@keys ){
    if ( $keys =~ m/$types/  )
    { 
      $keys =~ s/\[|\]//g;
      $keys =~ s/\<|\>//g;
      $keys =~ s/[\r\n\l]//g;
      $keys =~ s/\l//g;
      $keys =~ s/\r//g;
      $keys =~ tr/[A-Z]/[a-z]/;
      $flowtype = $keys;
      
    }else{ 
      if ( $flowtype =~ m/$flowtypes/i  )
      { 
        
        if ( $keys =~ m/^ *\[/  || $keys =~ m/^ *\</  || $keys eq "" )
        { 
          
        }else{ 
          $VFCtoken{$flowtype} = "$VFCtoken{$flowtype}$keys\n";
          
        } 
      }else{ 
      } 
    } 
  } 
} 
sub __LoadVFCTokens {
  local ( $tokfile ) = @_;
  $keyfile =  LoadFileAsString( $tokfile  );
  @keys = split(/[\r\n\l]/,$keyfile );
  foreach $keys (@keys ){
    if ( $keys =~ m/$types/  )
    { 
      $keys =~ s/\[|\]//g;
      $keys =~ s/\<|\>//g;
      $keys =~ tr/[A-Z]/[a-z]/;
      $flowtype = $keys;
      
    }else{ 
      if ( $flowtype =~ m/$flowtypes/  )
      { 
        
        if ( $keys =~ m/^ *\[/  || $keys =~ m/^ *\</  || $keys eq "" )
        { 
        }else{ 
          $VFCtoken{$flowtype} = "$VFCtoken{$flowtype}$keys\n";
          
        } 
      }else{ 
      } 
    } 
  } 
} 
sub GetMultiPartForm {
  
  local( $I, $key, $val , $F );
  
  $param{ User_Number } = "11231 21321 31231" ;
  if ($ENV{'REQUEST_METHOD'} eq 'POST')
  {
    
    read(STDIN, $in, $ENV{'CONTENT_LENGTH'});
    @lines = split(/[\r\n\l]/, $in);
    $end_of_record = $lines[0];
    $F = 0;
    
    foreach $lines (@lines)  {
      if ( $lines =~ s/Content-Disposition: form-data;// )
      { 
        if ( $lines =~ s/name=\"// )
        { 
          $lines =~ s/\"//;
          $lines =~ s/ //g;
          $key = $lines;
          if ( $key =~ m/filename/ )
          {
            @filekey = split(/;/, $key);
            
            $I = 0; 
            foreach $filekey (@filekey){
              $I = $I+1;  
              $fkey[$I] = $filekey;
            } 
            $key = $fkey[1];
            
            
            ( $value , $filename{ $fkey[1] }  ) = split(/=/, $fkey[2] );
            $filenames[$F] = $fkey[1];
            $F= $F+1;
            
          }else{
          } 
        }else{ 
        } 
      }else{ 
        if( $key eq "" || $lines eq "" )
        {
        } else { 
          $key =~ s/ //g;
          $key =~ s/\r//g;
          $key =~ s/\l//g;
          $key =~ s/[\r\n\l]//g;
          $key =~ s/\t//g;
          if ( $lines =~ m/$end_of_record/ )
          { 
            
            $key = "";
          }else{ 
            $param{$key} = "$param{$key}$lines\n";
            
          } 
        } 
      } 
    } 
    foreach $filenames (@filenames){
      # print get the name/value pair strings
    } 
    
    
  }
} 
#  FlowCode File: Lib1.0.ins.
#  Export  File: Lib1.0.pl.
#  Export  Date: 11:18:32 AM - 25:Feb:2001.


#include Lib1.0.pl
#  FlowCode File: KeySearch.ins.
#  Export  File: KeySearch.pl.
#  Export  Date: 11:45:14 AM - 25:Feb:2001.

