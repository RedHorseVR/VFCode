 
# use 
  $server_dir = "/home/sites/www.flowlynx.com/web/WebFlow" ; # $server_dir =  "C:\\Perl5\\bin";.
  $local_dir = "C:\\Program Files\\Apache Group\\Apache\\htdocs\\eCode\\WebFlow" ; # $local_dir = "W:\\WWWROOT\\Flowlynxinc\\WebFlow" ;.
  $webflow_dir = "/"; # $webflow_dir = "w:\\wwwroot\\webflow"; .
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
  $param{file1} = LoadFileAsString( "JOYTOY.c" ); # $param{file1} = LoadFileAsString( "TESTFILE path_complex.cpp" );.
  $language  =  "c.tok"; # $language  =  " master_vbasic.tok";.
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
  $flowname = "$filename{file1}.ins" ; # $flowname = "OUT.ins" ;.
  $output_path = "FlowFiles/" ; # $output_path = "" ;.
  $inline_comment = "\/\/";
  $flowname =~ s/"//g;
  $flowname =~ s/://g;
  $flowname =~ s/\\/_/g;
  $flowname =~ s/\n//g;
  $flowname =~ s/\l//g;
  $flowname =~ s/\r//g;
  $flowpage = "$flowname.html" ;
  $language  =  $param{language }; # $language  =  " master_vbasic.tok";.
  $stack_size = push  @FlowStack , "null" ;
  $stack_size = push  @FlowStack , "null" ;
  $stack_size = push  @FlowStack , "null" ;
   # print( " *** $language ...." );.
  if ( $param{file1} eq ""  )
  { 
    LoadStubs() ;
    ShowStubs() ;
  } else { 
     # ShowStubs() ;.
  } 
  LoadVFCTokens( "$language" );
   # PrintVFCtokens();.
  Parse( $param{file1} , "$language" , "$flowname"  ); # /print( "....$param{file1} " );//.
   # ShowResults( $flowname    ,  "$language" );.
  open( FP ,  ">$output_path$flowpage" )  or die " not opened\n ";
  select( FP );
  
    ShowResults( $flowname    ,  "$language" );
    close( FP ); 
  
  $out = LoadFileAsString( "$output_path$flowpage" );
  $out =~ s/VALUE=\"$flowname\"/VALUE=\"$output_path$flowname\"/ ; # point the applet correctly so we can run it via the script output..
  $out =~ s/open\(\"$flowname\"\)/open\(\"$output_path$flowname\"\)/ ; # point the download button correctly so we can run it via the script output..
  $out =~ s/\.\.\/STDs/STDs/ ; # point the help button correctly so we can run it via the script output..
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
   # print( STDIO "TOKFILE: $tokfile\n" );.
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
     # print( STDOUT  "$#lines ...  $lcnt .... $index ... $GlobalNextLine\n" );.
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
  }    # # End of SEARCHFILE.
  close (SEARCHFILE);  
}  
sub ProcessKeyCommands {
  $DBSTACK =""; # $DBSTACK ="yes";.
  local ( $key ) = @_;
  local ( $rtn , $N );
  $rtn = "true";
  if ( $key=~m/\$\|\$/  )
  { 
    @cmd = split(/\$\|\$/, $key);
    $N=0;
     # $cmd = $directive[$N];.
    foreach $cmd (@cmd){
      while( $cmd && $rtn eq "true" && $N>0 ){
         # print( STDOUT ">>>>>>>>>>>>>>>> $cmd\n " );.
        $cmd =~ s/ //g; # DOES NOT ALLOW SPACES.
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
            if ( $stackvalue=~ m/$cmd/ ) # if ( $cmd=~ m/$stackvalue/ ).
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
                if ( $value=~ m/$cmd/ ) # if ( $cmd=~ m/$value/ ).
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
                             # print( STDOUT ">>>>>>> NEXTSYMBOLNOT $cmd ...$GlobalNextLine ... line : $index \n" );.
                             # print( STDOUT "****>>>>>>> NEXTSYMBOLNOT HIT \n" );.
                            $rtn = "";
                            $rtn; return;
                          }else{ 
                          } 
                        }else{ 
                          if( $cmd =~ s/NEXTSYMBOL//  )
                          { 
                            if ( $GlobalNextLine=~m/$cmd/  )
                            { 
                               # print( STDOUT ">>>>>>> NEXTSYMBOL $cmd ...$GlobalNextLine ... \n" );.
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
       # $N = $N+1;.
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
   # print( STDOUT ">>>>>>>>>>>>>>>> $key \n.. " );.
  if ( $matchcase =~ m/true/ ) # if ( $case_sensitive eq "case_sensitive" ).
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
     # if($DBSTACK){  print( STDOUT "\n-----------------------------------\nMATCHLINE: $line\nNEXTSYM: $GlobalNextLine\n-----------------------------PATTERN: $key\n" );}.
    if ( ProcessKeyCommands( $keycopy ) )
    { 
    }else{ 
       # print( STDOUT "$keycopy was FALSE  process override ... $line \n" );.
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
   # print( STDOUT "." );.
  foreach $keys (@keys ){
    if ( $keys =~ m/$types/  )
    { 
      $keys =~ s/\[|\]//g;
      $keys =~ tr/[A-Z]/[a-z]/;
      $flowtype = $keys;
       # print( "$flowtype\n" );.
    }else{ 
      if (  $keys =~ m/^\[/  )
      { 
        $flowtype = $keys;
      }else{ 
      } 
      if ( $flowtype =~ m/$flowtypes/  )
      { 
        ($param, $comment) = split(/$inline_comment/, $line , 2 ); # get the name/value pair strings.
         # print( STDOUT "|$param\n" );.
        $case = $param{case_sensitive};
        $GlobalPoppedStack = ""; # SET IN ProcessKeyCommands() buffers any flowtypes that need to be automatically popped into the output ... see command: POPALL.
        if ( MatchLine($param , $comment , $keys, $case ) ) # if ( $param =~ m/$keys/i   ).
        { 
          if ( $last_type eq "branch"  && $flowtype ne "path" )
          { 
            print( "path( );\/\/ AUTO\n" ); # MAIN FLOWFILE OUTPUT.
          }else{ 
          } 
          print( "$flowtype( $param );\/\/ $comment\n" ); # MAIN FLOWFILE OUTPUT.
          print( "$GlobalPoppedStack" ); # MAIN FLOWFILE OUTPUT.
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
   # print "<pre>"; .
  print( "\ntokens for language $language are: \n" );
  foreach $vfctype  (@vfctype  ){
    print( "\n[$vfctype]\n" );
    print( "$VFCtoken{$vfctype}\n" );
  } 
   # print "\n.....</pre>";.
} 
sub LoadFileAsString {
  local ( $file ) = @_;
  local ( $keyfile ) ;
  open( FILE, $file );
  while(<FILE>) {
    s/^ *\n//;
    tr/\t/ /;
    $keyfile = "$keyfile$_";
  }    # # End of SEARCHFILE.
  close (SEARCHFILE);  
$keyfile; }
sub send_mail1 {
   # &send_mail(  "/usr/lib/sendmail" , "info\@flowlynx.com" , "DEMO 6 Input- $param{EmailList} - $param{Name}" , "Time:$time_string\n------------------------\n$mail_record"  );.
  local( $sprg, $addr , $sbj, $msg ) = @_; 
  open( SMAIL, "| $sprg -t"); 
  print( SMAIL  "To: ", $addr, "\n" , "From: ", $param{Email} , "\n" , "Subject: ", $sbj,"\n\n", $msg );
  close(SMAIL); 
} 
sub send_mail { 
  local( $to , $from ,  $sbj, $msg ) = @_;
  open( SMAIL, "| /usr/lib/sendmail -t");
  print( SMAIL  "To: ", $to, "\n" , "From: ", $from ,  "\n" , "Subject: ", $sbj , "\n\n", $msg );
  close(SMAIL); 
} 
sub SendCMD {
  local( $cmd , @output ) = @_;
   # print "Issuing Command>> $cmd \n";.
  open( CD ,  "$cmd  |" )  || die ("\n ERROR >>>>>>>>$cmd not executed because not able to open \n "); # open( CD ,  "c:\\jdk1.1\\bin\\java.exe  testDbfFile  |" )  || die ("\n >>>>>>>>not opened\n ");.
  @capture = <CD> ; # @capture = 'c:\\jdk1.2.2\\bin\\java.exe  testDbfFile' ;.
   # print "output from command >> @capture\n";.
}
sub LoadVFCTokens {
  local ( $tokfile ) = @_;
  $keyfile =  LoadFileAsString( $tokfile  );
   # print( "[[[$tokfile]]]   " );.
   # print( "[[[$keyfile]]]   " );.
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
       # print( "<b>$flowtype  </b>" );.
    }else{ 
      if ( $flowtype =~ m/$flowtypes/i  )
      { 
         # print "<pre>{{$flowtype}}::$key\n</pre> ";.
        if ( $keys =~ m/^ *\[/  || $keys =~ m/^ *\</  || $keys eq "" )
        { 
           # print( " $keys " );.
        }else{ 
          $VFCtoken{$flowtype} = "$VFCtoken{$flowtype}$keys\n";
           # print( "<pre> VFCtoken{ $flowtype } << $VFCtoken{$flowtype} \n</pre> " );.
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
       # print( "$flowtype\n" );.
    }else{ 
      if ( $flowtype =~ m/$flowtypes/  )
      { 
         # print "<pre>{{$flowtype}}::$keys</pre> ";.
        if ( $keys =~ m/^ *\[/  || $keys =~ m/^ *\</  || $keys eq "" )
        { 
        }else{ 
          $VFCtoken{$flowtype} = "$VFCtoken{$flowtype}$keys\n";
           # print( " $keys " );.
        } 
      }else{ 
      } 
    } 
  } 
} 
sub GetMultiPartForm { 
   # local (*in) = @_ if @_;.
  local( $I, $key, $val , $F );
   # $| = 1;.
  $param{ User_Number } = "11231 21321 31231" ; 
  if ($ENV{'REQUEST_METHOD'} eq 'POST') 
  { #  auto path .
     # print "<pre>"; .
    read(STDIN, $in, $ENV{'CONTENT_LENGTH'}); #  How many bytes are we supposed to receive? .
    @lines = split(/[\r\n\l]/, $in); # // make a list of keyword/value pairs////.
    $end_of_record = $lines[0];
    $F = 0;
     # print( " $end_of_record <hr> " );.
    foreach $lines (@lines)  {
      if ( $lines =~ s/Content-Disposition: form-data;// )
      { 
        if ( $lines =~ s/name=\"// )
        { 
          $lines =~ s/\"//;
          $lines =~ s/ //g;
          $key = $lines;
          if ( $key =~ m/filename/ )
          { # multi line.
            @filekey = split(/;/, $key); #  make a list of keyword/value pairs.
             # $lines =~ s/Content-Type: application\/octet-stream//;.
            $I = 0; 
            foreach $filekey (@filekey){
              $I = $I+1;  
              $fkey[$I] = $filekey;
            } 
            $key = $fkey[1];
             # print ">> $fkey[1]\n";.
             # print ">> $fkey[2]\n";.
            ( $value , $filename{ $fkey[1] }  ) = split(/=/, $fkey[2] ); # get the name/value pair strings .
            $filenames[$F] = $fkey[1];
            $F= $F+1;
             # print "\nfilename( $fkey[1] ) = $filename{ $fkey[1] }<hr>";.
          }else{ # single line.
          } 
        }else{ 
        } 
      }else{ 
        if( $key eq "" || $lines eq "" ) # skip blank lines and onew without keys.
        {
        } else { 
          $key =~ s/ //g;
          $key =~ s/\r//g;
          $key =~ s/\l//g;
          $key =~ s/[\r\n\l]//g;
          $key =~ s/\t//g;
          if ( $lines =~ m/$end_of_record/ ) # look for end of records.
          { 
             # print "<pre>{$key}$param{$key}</pre><hr>" ;.
            $key = "";
          }else{ 
            $param{$key} = "$param{$key}$lines\n";
             # print( "..... $lines\n" );.
          } 
        } 
      } 
    } 
    foreach $filenames (@filenames){
      # print get the name/value pair strings # print( "<h3>filename{ $filenames } name is : $filename{ $filenames } </h3>"  );.
    } 
     # SaveFile( "sourcefile.txt" , $in );.
     # print "</pre>"; .
  } 
}  
#  FlowCode File: Lib1.0.ins.
#  Export  File: Lib1.0.pl.
#  Export  Date: 09:46:25 PM - 16:Nov:2001.

