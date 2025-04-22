#!/usr/bin/perl --
  


















$root_web_path = "/home/sites/www.flowlynx.com/web";
$root_web_path = ".";
$html_url = "search.htm";


$server_url = "http://206.166.222.162";



$search_script = "search.pl";





$banned_files = "";




sub PrintHeaderHTML  
  {  
  local($user) = @_;  
print <<__HEADERHTML__;
<html><head><title>$search_results_title</title></head>  
<body>  
<h2><center>$user Search Engine Output</center></h2>  
<center>  
<hr><p>  
</center>  
<center><h3>Your keyword(s) <font color=#ff0000><i>$keywords</i></font>
appear on these pages:</h3></center><ul>  
__HEADERHTML__
}  




sub PrintBodyHTML  
  {  
  local($filename, $title) = @_;  
print <<__bodyHTML__;
<li>  
<b>  
<a href="$filename">
$title</a>  
</b>  
($filename)<br>
__bodyHTML__
}  


sub PrintFooterHTML  
  {  
  local($number_of_hits) = @_;  
print <<__FOOTERHTML__  ;
<br><center><b><font size=2>Your search on <i>'$keywords'</i> found <font color=  #ff0000>
$number_of_hits </font>page(s) containing the selected keyword(s)</b>  
</font><br><font size=2><i><b>Refine your  
keyword search by pressing 'Ctrl+F'  
to locate your keyword when viewing pages.</b>  
</i></font><br>  
<a href=$html_url><b>START A NEW SEARCH</b></a>  
<p>  
<hr>  
</center> </body> </html>  
__FOOTERHTML__
}  


sub PrintNoHitsBodyHTML  
  {  
print <<__NOHITS__;
<p>  
<center>  
<h2>No pages were found containing your keyword(s).</h2>  
</center>  
<p>  
__NOHITS__
}   


sub PrintNoKeywordMessage  {
  local ($user) = @_ ;
  print  ("<h2><center>$user Search Engine Error</center></h2>");
  print ("<b>You MUST enter one or more keywords to use this search engine. </b> ");
  print ("  <a href=$html_url>Return to the search input form. </a>");
}  
#  FlowCode File: setup.ins.
#  Export  File: setup.pl.
#  Export  Date: 02:18:15 PM - 06:Dec:2000.


  #include setup.pl
















$cgi_lib'version = sprintf("%d.%02d", q$Revision: 2.14 $ =~ /(\d+)\.(\d+)/);  


$cgi_lib'maxdata = 131072;   
$cgi_lib'writefiles = 0;   

$cgi_lib'filepre = "cgi_lib";

$cgi_lib'bufsize = 8242;   
$cgi_lib'maxbound = 100;   
$cgi_lib'headerout = 0;   


















sub ReadParse {  
  local (*in) = shift if @_;   
  local (*incfn,   
  *inct,   
  *insfn) = @_;   
  local ($len, $type, $meth, $errflag, $cmdflag, $perlwarn, $got);  
  
  
  $perlwarn = $^W;  
  $^W = 0;  
  binmode(STDIN);   
  binmode(STDOUT);   
  binmode(STDERR);  
  
  $type = $ENV{'CONTENT_TYPE'};  
  $len = $ENV{'CONTENT_LENGTH'};  
  $meth = $ENV{'REQUEST_METHOD'};  
  if ($len > $cgi_lib'maxdata) {   
  
    &CgiDie("cgi_lib.pl: Request to receive too much data: $len bytes\n");
  }  
  if (!defined $meth || $meth eq '' || $meth eq 'GET' ||    $type eq 'application/x-www-form-urlencoded') {
  
    local ($key, $val, $i);  
    
    if (!defined $meth || $meth eq '') {  
    
      $in = $ENV{'QUERY_STRING'};  
      $cmdflag = 1;   
    } elsif($meth eq 'GET' || $meth eq 'HEAD') {  
      $in = $ENV{'QUERY_STRING'};  
    } elsif ($meth eq 'POST') {  
      if (($got = read(STDIN, $in, $len) != $len))  
      {$errflag="Short Read: wanted $len, got $got\n";};  
      
    } else {  
      &CgiDie("cgi_lib.pl: Unknown request method: $meth\n");
    }  
    @in = split(/[&;]/,$in);  
    push(@in, @ARGV) if $cmdflag;   
    foreach $i (0 .. $#in) {
      
      $in[$i] =~ s/\+/ /g;  
      
      ($key, $val) = split(/=/,$in[$i],2);   
      
      $key =~ s/%([A-Fa-f0-9]{2})/pack("c",hex($1))/ge;  
      $val =~ s/%([A-Fa-f0-9]{2})/pack("c",hex($1))/ge;  
      
      $in{$key} .= "\0" if (defined($in{$key}));   
      $in{$key} .= $val;  
    }  
  } elsif ($ENV{'CONTENT_TYPE'} =~ m#^multipart/form-data#) {
    
    ##  $errflag = !(eval <<"END_MULTIPART" );
    local ($buf, $boundary, $head, @heads, $cd, $ct, $fname, $ctype, $blen);  
    local ($bpos, $lpos, $left, $amt, $fn, $ser);  
    local ($bufsize, $maxbound, $writefiles) =  
    ($cgi_lib'bufsize, $cgi_lib'maxbound, $cgi_lib'writefiles);  
    
    $buf = '';  
    ($boundary) = $type =~ /boundary="([^"]+)"/;   
    ($boundary) = $type =~ /boundary=(\S+)/ unless $boundary;  
    &CgiDie ("Boundary not provided: probably a bug in your server")  
    unless $boundary;  
    $boundary = "--" . $boundary;  
    $blen = length ($boundary);  
    if ($ENV{'REQUEST_METHOD'} ne 'POST') {  
    
      &CgiDie("Invalid request method for multipart/form-data: $meth\n");  
    }  
    if ($writefiles) {  
    
      local($me);  
      stat ($writefiles);  
      $writefiles = "/tmp" unless -d _ && -r _ && -w _;  
      
      $writefiles .= "/$cgi_lib'filepre";  
    }  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    $left = $len;  
    PART:   
    while (1) {  
      die $@ if $errflag;  
      $amt = ($left > $bufsize+$maxbound-length($buf)  
      ? $bufsize+$maxbound-length($buf): $left);  
      $errflag = (($got = read(STDIN, $buf, $amt, length($buf))) != $amt);  
      die "Short Read: wanted $amt, got $got\n" if $errflag;  
      $left -= $amt;  
      $in{$name} .= "\0" if defined $in{$name};  
      $in{$name} .= $fn if $fn;  
      $name=~/([-\w]+)/;   
      if (defined $1) {  
      
        $insfn{$1} .= "\0" if defined $insfn{$1};  
        $insfn{$1} .= $fn if $fn;  
      }  
      BODY:  
      while (($bpos = index($buf, $boundary)) == -1) {  
        die $@ if $errflag;  
        if ($name) {   
        
          if ($fn) { print FILE substr($buf, 0, $bufsize); }  
          else { $in{$name} .= substr($buf, 0, $bufsize); }  
          
        }  
        $buf = substr($buf, $bufsize);  
        $amt = ($left > $bufsize ? $bufsize : $left);   
        $errflag = (($got = read(STDIN, $buf, $amt, $maxbound)) != $amt);  
        die "Short Read: wanted $amt, got $got\n" if $errflag;  
        $left -= $amt;  
      }  
      if (defined $name) {   
      
        if ($fn) { print FILE substr($buf, 0, $bpos-2); }  
        else { $in {$name} .= substr($buf, 0, $bpos-2); }   
        
      }  
      close (FILE);  
      last PART if substr($buf, $bpos + $blen, 4) eq "--\r\n";  
      substr($buf, 0, $bpos+$blen+2) = '';  
      $amt = ($left > $bufsize+$maxbound-length($buf)  
      ? $bufsize+$maxbound-length($buf) : $left);  
      $errflag = (($got = read(STDIN, $buf, $amt, length($buf))) != $amt);  
      die "Short Read: wanted $amt, got $got\n" if $errflag;  
      $left -= $amt;  
      undef $head; undef $fn;  
      HEAD:  
      while (($lpos = index($buf, "\r\n\r\n")) == -1) {  
        die $@ if $errflag;  
        $head .= substr($buf, 0, $bufsize);  
        $buf = substr($buf, $bufsize);  
        $amt = ($left > $bufsize ? $bufsize : $left);   
        $errflag = (($got = read(STDIN, $buf, $amt, $maxbound)) != $amt);  
        die "Short Read: wanted $amt, got $got\n" if $errflag;  
        $left -= $amt;  
      }  
      $head .= substr($buf, 0, $lpos+2);  
      push (@in, $head);  
      @heads = split("\r\n", $head);  
      ($cd) = grep (/^\s*Content-Disposition:/i, @heads);  
      ($ct) = grep (/^\s*Content-Type:/i, @heads);  
      ($name) = $cd =~ /\bname="([^"]+)"/i;   
      ($name) = $cd =~ /\bname=([^\s:;]+)/i unless defined $name;  
      ($fname) = $cd =~ /\bfilename="([^"]*)"/i;   
      ($fname) = $cd =~ /\bfilename=([^\s:;]+)/i unless defined $fname;  
      $incfn{$name} .= (defined $in{$name} ? "\0" : "") .  
      (defined $fname ? $fname : "");  
      ($ctype) = $ct =~ /^\s*Content-type:\s*"([^"]+)"/i;   
      ($ctype) = $ct =~ /^\s*Content-Type:\s*([^\s:;]+)/i unless defined $ctype;  
      $inct{$name} .= (defined $in{$name} ? "\0" : "") . $ctype;  
      if ($writefiles && defined $fname) {  
      
        $ser++;  
        $fn = $writefiles . ".$$.$ser";  
        open (FILE, ">$fn") || &CgiDie("Couldn't open $fn\n");  
        binmode (FILE);   
      }  
      substr($buf, 0, $lpos+4) = '';  
      undef $fname;  
      undef $ctype;  
    } 
    1;
    END_MULTIPART:
    if ($errflag)
    {
      local ($errmsg, $value);  
      $errmsg= $@||$errflag;
      foreach $value (values %insfn) {  
        unlink(split("\0",$value));  
      }  
      &CgiDie($errmsg);  
    } else {  
      
    }  
  } else {  
    &CgiDie("cgi_lib.pl: Unknown Content-type: $ENV{'CONTENT_TYPE'}\n");
  }  
  
  $insfn = $insfn;  
  $incfn = $incfn;  
  $inct = $inct;  
  $^W = $perlwarn;  
return ($errflag ? undef : scalar(@in));  
}  



sub PrintHeader {  
  return "Content-type: text/html\n\n";  
}  




sub HtmlTop  
  {  
  local ($title) = @_;  
return <<END_OF_TEXT;  
<html>  
<head>  
<title>$title</title>  
</head>  
<body>  
<h1>$title</h1>  
END_OF_TEXT
}  


sub HtmlBot  
  {  
  return "</body>\n</html>\n";  
}  


sub SplitParam  
  {  
  local ($param) = @_;  
  local (@params) = split ("\0", $param);  
  return (wantarray ? @params : $params[0]);  
}  



sub MethGet {  
  return (defined $ENV{'REQUEST_METHOD'} && $ENV{'REQUEST_METHOD'} eq "GET");  
}  



sub MethPost {  
  return (defined $ENV{'REQUEST_METHOD'} && $ENV{'REQUEST_METHOD'} eq "POST");  
}  



sub MyBaseUrl {  
  local ($ret, $perlwarn);  
  $perlwarn = $^W; $^W = 0;  
  $ret = 'http://' . $ENV{'SERVER_NAME'} .  
  ($ENV{'SERVER_PORT'} != 80 ? ":$ENV{'SERVER_PORT'}" : '') .  
  $ENV{'SCRIPT_NAME'};  
  $^W = $perlwarn;  
  return $ret;  
}  



sub MyFullUrl {  
  local ($ret, $perlwarn);  
  $perlwarn = $^W; $^W = 0;  
  $ret = 'http://' . $ENV{'SERVER_NAME'} .  
  ($ENV{'SERVER_PORT'} != 80 ? ":$ENV{'SERVER_PORT'}" : '') .  
  $ENV{'SCRIPT_NAME'} . $ENV{'PATH_INFO'} .  
  (length ($ENV{'QUERY_STRING'}) ? "?$ENV{'QUERY_STRING'}" : '');  
  $^W = $perlwarn;  
  return $ret;  
}  




sub MyURL {  
  return &MyBaseUrl;  
}  








sub CgiError {  
  local (@msg) = @_;  
  local ($i,$name);  
  if (!@msg) {  
  
    $name = &MyFullUrl;  
    @msg = ("Error: script $name encountered fatal error\n");  
  };  
  if (!$cgi_lib'headerout) {   
  
    print &PrintHeader;  
    print "<html>\n<head>\n<title>$msg[0]</title>\n</head>\n<body>\n";  
  }  
  print "<h1>$msg[0]</h1>\n";  
  foreach $i (1 .. $#msg) {
    print "<p>$msg[$i]</p>\n";  
  }  
  $cgi_lib'headerout++;  
}  



sub CgiDie {  
  local (@msg) = @_;  
  &CgiError (@msg);  
  die @msg;  
}  







sub PrintVariables {  
  local (*in) = @_ if @_ == 1;  
  local (%in) = @_ if @_ > 1;  
  local ($out, $key, $output);  
  $output = "\n<dl compact>\n";  
  foreach $key (sort keys(%in)) {  
    foreach (split("\0", $in{$key})) {  
      ($out = $_) =~ s/\n/<br>\n/g;  
      $output .= "<dt><b>$key</b>\n <dd>:<i>$out</i>:<br>\n";  
    }  
  }  
  $output .= "</dl>\n";  
  return $output;  
}  



sub PrintEnv {  
  &PrintVariables(*ENV);  
}  

$cgi_lib'writefiles = $cgi_lib'writefiles;  
$cgi_lib'bufsize = $cgi_lib'bufsize ;  
$cgi_lib'maxbound = $cgi_lib'maxbound;  
$cgi_lib'version = $cgi_lib'version;  
$cgi_lib'filepre = $cgi_lib'filepre;  
;   

# forward declairations 
  sub send_mail; 
  sub GetUserRecord;
  sub Get_Rec;
  sub VerifyUserNumber;
  sub GetParams;
  sub gets ;
  sub search ;
  sub add ;
  sub validate;

sub send_mail { 
  local( $sprg, $addr , $sbj, $msg ) = @_; 
  open( SMAIL, "| $sprg -t"); 
  print( SMAIL  "To: ", $addr, "\n" , "Subject: ", $sbj,"\n\n", $msg );
  close(SMAIL); 
} 
sub Get_Rec {
  
  $data = "";
  while( eof( FP ) != 1 ) {
    $char = getc( FP ) ;
    
    if (  $char eq "\n"    )
    { 
      return ;
    } else { 
      
      
      $data = join("",$data,$char);
    } 
  } 
  
} 
sub GetDirArray{
  # CGI input
  
  open( FP ,  "dirs.txt" )  or die( "authorized user list did not open\n " );
  $count = 0;
  while( eof( FP) != 1 ) {
    Get_Rec( $data );
    $dirs[$count]=$data;
    
    $count++;
  } 
  close( FP );  
} 
sub search {
  open( FP ,  "database.tsv" )  or die "database.tsv not opened\n ";
  $count = 0;
  while( length( $param{fname} ) > 0) {
    gets();
    $temp1 = $param{fname} ;
    
    $temp2 = $data ;
    
    if ( index(  $temp2 ,  $temp1  ) != -1  )
    { 
      $count++;
      print "$data\n";
    } else { 
      print ">>> $data\n";
    } 
    if ( eof(FP) )
    { 
      print "<hr><h2><i>$count matches found for [$param{fname}]</t></h2> ";
      return; 
    } 
  } 
  print "<h2><i>$param{name} ... Null  length search string ... no files matched.</t></h2> ";
} 
sub gets  {
  $data = "";
  while( $char = getc( FP ) ) {
    if (  $char eq "\n"  )
    { 
      return;
    } else { 
      $data = join("",$data,$char);
    } 
  } 
} 
#  FlowCode File: cgi_lib.ins.
#  Export  File: cgi_lib.pl.
#  Export  Date: 04:18:47 PM - 18:Dec:2000.


  #include cgi_lib.pl
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

sub ThemeOpen {
  print"<html><head><title>Search Output</title></head>";
  print"<body background=\"back2.gif\" bgcolor=\"#FFFFFF\" >";
  print "<center>";
  print "<img src=\"logo1.gif\" alt=\"logo1.gif \"> ";
  print "</center>";
} 
sub ThemeClose {
  print "</h3>";
  print "</body></html> ";
} 
# program 
  $lib = ".";  
  
  
  if ($search_script eq "") {  
  
    $search_script = "search.pl";
  }  
  
  print "Content-type: text/html\n\n"; 
  ThemeOpen();
  GetParams();
  
  Search();
  ThemeClose();

sub GetParams{
  
  $| = 1;
  
  
  if ($ENV{'REQUEST_METHOD'} eq 'POST')
  {
    
    read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
    @pairs = split(/&/, $buffer);
    
    foreach $pair (@pairs){
      ($name, $value) = split(/=/, $pair);
      $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
      $count = $value =~ tr/+/ /;
      $count = $value =~ tr/\n/ /;
      $count = $value =~ tr/\r/ /;
      $count = $value =~ tr/|/ /;
      $in{$name} = $value;
      
      
    }
  } else { 
    
    $in{ keywords } =  $ENV{'QUERY_STRING'}  ;
  }
} 
sub Search{
  
  
  $keywords = $in{'keywords'};  
  $exact_match = $in{'exact_match'};  
  $hidden_files = $in{'hidden_files'};  
  $user = $in{'user'};  
  
  
  
  $unwanted_files = ($hidden_files . "|" . $banned_files);  
  
  
  @unwanted_files = split(/\|+/,$unwanted_files);  
  
  
  @keyword_list = split(/\s+/,$keywords);  
  
  
  if ($keywords eq "") {  
  
    
    
    print  ("<h2><center>$user Search Engine Error</center></h2>");
    print ("<b>You MUST enter one or more keywords to use this search engine. </b> ");
    print ("  <a href=search.htm>Return to the search input form. </a>");
    
    exit;  
  } else { 
  }  
  &PrintHeaderHTML($user);  
  $number_of_hits = 0;  
  $cur_dir = 1;
  @dirs = ($root_web_path);  
  GetDirArray;
  $root_web_path = $dirs[0];
  
  $end_of_all_files = 0;  
  while ( $dirs[$cur_dir] ) {
    $directory = "$root_web_path/$dirs[$cur_dir]" ;
    
    opendir("DIR$cur_dir", $directory );
    $filename = &GetNextEntry("DIR$cur_dir", $directory );
    while( $filename ){
      SearchFile();
      $filename = &GetNextEntry("DIR$cur_dir", $directory );
    } 
    $cur_dir++;
  }  
  
  if ($number_of_hits == 0) {  
  
    &PrintNoHitsBodyHTML;  
  } else { 
    &PrintFooterHTML($number_of_hits, $html_url);  
  }  
  
  
} 

sub SearchFile {
  $fullpath = "$root_web_path/$dirs[$cur_dir]/$filename";
  
  
  
  $unwanted_file = 0;  
  foreach (@unwanted_files) {  
    if ($fullpath =~ /$_/) {  
    
      $unwanted_file = 1;  
    }  
  }  
  if ($unwanted_file) {  
  
    
  } else { 
    
    
    if (-r $fullpath) {  
    
    } else { 
      
    }  
    
    
    
    
    
    @not_found_words = @keyword_list;  
    $are_we_in_head = 0;  
    open(SEARCHFILE, $fullpath);  
    
    $headline = "";  
    while(<SEARCHFILE>) {  
      
      $line = $_;  
      $headline .= $line if ($are_we_in_head == 0);  
      $are_we_in_head = 1  
      if (($line =~ m!</head>!i) || ($line =~ m!</title>!i));  
      
        &FindKeywords($exact_match, $line, *not_found_words);  
      
    }   
    close (SEARCHFILE);  
    if (@not_found_words < 1)  
    {  
      
      $headline =~ s/\n/ /;  
      $headline =~ m!<title>(.*)</title>!i;  
      $title = $1;  
      if ($title eq "") {  
      
        $title = "This Page Has No Title";  
      }  
      
      &PrintBodyHTML( "../$dirs[$cur_dir]/$filename", "$dirs[$cur_dir]/$filename");
      $number_of_hits++;  
    }  
  }  
} 
sub FindKeywords {  
  local($exact_match, $line, *not_found_words) = @_;  
  local($x, $match_word);  
  if ($exact_match eq "on") {  
  
    for ($x = @not_found_words; $x > 0; $x--) {  
      
      $match_word = $not_found_words[$x - 1];  
      if ($line =~ /\b$match_word\b/i) {  
      
        splice(@not_found_words,$x - 1, 1);  
      }  
    }  
  } else {  
    for ($x = @not_found_words; $x > 0; $x--) {  
      $match_word = $not_found_words[$x - 1];  
      if ($line =~ /$match_word/i) {  
      
        splice(@not_found_words,$x - 1, 1);  
      }  
    }  
  }  
}  


sub GetNextEntry {  
  local($dirhandle, $directory) = @_;  
  
  while ($filename = readdir($dirhandle)) {  
    
    if (  $filename =~/html.?/i || $filename =~/htm.?/i ) {
    
      
      last;  
    }  
  }  
  
  $filename;  
}  


#  FlowCode File: search.ins.
#  Export  File: search.pl.
#  Export  Date: 04:19:27 PM - 18:Dec:2000.

