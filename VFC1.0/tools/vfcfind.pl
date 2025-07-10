use File::Find;#// //////
use File::Basename;# ////
use File::Find::Rule;# ////
$HIT_TOTAL = 0;

my $ps;#// //////
sub start_powershell {# ////
	return if $ps;# ////
# // Open a persistent PowerShell process//
open($ps, '|-', 'powershell -Command -') or die "Can't start PowerShell: $!";# ////
select((select($ps), $| = 1)[0]);# // Autoflush to make output instant//
}#// //////
sub cprint {# ////
	my ($text, $color) = @_;# ////
	# // Escape any single quotes in the text to prevent PowerShell issues //
	start_powershell();# // Ensure PowerShell is running//
	# // Escape any single quotes//
	$text =~ s/'/'\''/g;# ////
	#// // Send the command to PowerShell////
	print $ps "Write-Host '$text' -ForegroundColor $color\n";# ////
	} 
$default = "\e[0m" ;#resets to default color
my $reset     = "\e[0m";# ////
my $bold      = "\e[1m";# ////
my $black     = "\e[30m";# ////
my $red       = "\e[31m";# ////
my $green     = "\e[32m";# ////
my $yellow    = "\e[33m";# ////
my $blue      = "\e[34m";# ////
my $magenta   = "\e[35m";# ////
my $cyan      = "\e[36m";# ////
my $white     = "\e[37m";# ////
# // Bright variants//
my $bright_red     = "\e[1;31m";# ////
my $bright_green   = "\e[1;32m";# ////
my $bright_yellow  = "\e[1;33m";# ////
my $bright_blue    = "\e[1;34m";# ////
sub GetLines{ local ( $filename , $word_to_find  , $type ) = @_;
	open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";# ////
	my $line_number = 0;# ////
	$found = 0;
	#print( "******************** $type \n\n  " );
	$VFCtoken = "^(generic|variable|input|event|process|set|output|loop|lend|branch|path|bend|end)" ;
	while (my $row = <$fh>) {# ////
		# // Remove ANSI escape sequences //
		$row =~ s/\x1B[\(\)][0-9A-Za-z]*//g;#  # Extra escape variations
		$row =~ s/[^\x20-\x7E\r\n\t]//g;# // Removes non-printable, keeps tabs/newlines//
		if ($row =~ /[^\x00-\x7F]/   || $row =~ m/\x/ )#if ($row[$i] !~ /^[\x01-\x7F]*$/)
		{
			next ;#// //////
			
		} else {
			}
		$line_number++;# ////
		if(  $EXTEN =~ m/vfc/i  ) { $row =~ s/$VFCtoken// } ;#<---- CLEANS THE TOKEN FOR vfc FILE ONLY 
		#$tok = $& ;
		#$row =~ s/;\/\/.*// ;
		$row =~ s/\n// ;
		if($row =~ m/$word_to_find/) {#/// ////////if($row =~ /\b$word_to_find\b/) {
			if ( $type =~ m/$VFCtoken/  &&  $EXTEN =~ m/vfc/i   )
			{
				if ( $tok =~ m/^$type/ )
				{
					$found += 1;
					if ( $EXTEN =~ m/vfc/i  )
					{
						#print "$bright_green";
						print "\tvfc $filename  $line_number\t$default|--------> $tok$row;\n";
						}
				}else{
					}
			}else{
				$found += 1;
				if ( $EXTEN =~ m/vfc/i  )
				{
					#print "$green";
					cprint( "\tvfc $filename  $line_number\t$default|---- $EXTEN ----> $tok$row;" , 'red'  );# ////
				} else {
					if ( $filename !~ /\.vfc$/ )
					{
						cprint ( "\tvfc $filename   $line_number\t$default| line: $line_number  ---$EXTEN ----> $tok$row" , 'green' );# ////
					} else {
						if (-e "$filename.vfc" )
						{
							#print "$cyan";
							cprint ( "\tvfc $filename   $line_number\t$default| line: $line_number  ---$EXTEN ----> $tok$row", 'cyan' );# ////
						}else{
							#print "$yellow";
							cprint ( "\tvfc $filename   $line_number\t$default| line: $line_number  ---$EXTEN ----> $tok$row" , 'yellow'  );# ////
							}
						}
					}
				}
			}#// //////
		#print "$reset";
		}#// //////
	
	close($fh);# ////
	if ( $found > 0  )
	{
		print "\n\tVFC LOC: $line_number :: $found HIT(s)\n\n";
		$HIT_TOTAL += $found ;
		}
	return $line_number; }
$EXTEN  = "\.vfc" ; 
sub process_files{ my( $dir , $word , $type , $size_args ) = @_;
	opendir(DIR, $dir) or die "Could not open $dir in process_files \n";# ////
	$total_lines  = 0;
	$FIRST_HIT = "True" ;
	while (my $file = readdir(DIR)) {# ////
		#print ( "\tvfc $file  \n" );
		if ( $EXTEN =~ m/files/ )
		{
			#print ( "\tvfc $file == $word \n" );
			if ( $file =~ m/$word/ && $file !~ m/^_/ &&  $file !~ m/\.vfc$/ )
			{
				if (-e "$dir/$file.vfc" )
				{
					print "-->";#print "$cyan";
				}else{
					#print "$yellow";
					}
				print ( "\tvfc $dir/$file  \n" ); 
			} else {
				}
		}else{
			if ( ( $file =~ m/$EXTEN$/i  ||  '*' =~ m/$EXTEN$/i   ) &&   -f "$dir/$file") {# if ( $file =~ m/$EXTEN$/i    &&   -f "$dir/$file") {
				#$FOLDER_FIRST_HIT = "False";
				
				$VFCfile = "$dir\\$file" ;
				$VFCfile  =~ s/\\\//\\/;
				#print "   <$EXTEN> \n";
				$ROOT = basename( $VFCfile ) ; 
				if (  (  $ROOT !~ /^[_]/ ) )#if ( $VFCfile =~ m/$EXTEN$/i  && (   ".vfc" =~ m/$EXTEN$/i   ||  $ROOT !~ /^[_]/ ) )
				{
					$VFCfile =~ tr|/|\\|;
					if ( ".vfc" =~ m/$EXTEN/i   &&  ".*" !~ m/$EXTEN/i   )
					{
						print "$bright_blue";
						print "vfc2000 $VFCfile\n";# print "=====================\n";
						print "$default";
						}
					$lines = GetLines( $VFCfile , $word , $type  ) ;
					#if ( $FIRST_HIT == "True" && length($lines)>0 ) { print "<$EXTEN> $VFCfile\n"; $FIRST_HIT = "False";}
					$total_lines  += $lines ;
					#print "$VFCfile $lines\n";
					}
				}#// //////
			}
		}#// //////
	
	closedir(DIR);# ////
	return $total_lines  ;   }
#main#// // Print the directories ////
	#my $dir = shift @ARGV or die "Usage: $0 <directory>\n";
	my $dir = "";
	my $word = "";
	my $size = $#ARGV + 1;
	print "The size of \@ARGV is $size\n";
	if ( $size >=  1) {# ////
	# // Get the directory and file names from the arguments //
		$A = $ARGV[0] ;
		$A1 = $ARGV[1] ;
		$A2 = $ARGV[2] ;
		print "args: $A, $A1, $A2 --- @ARGV \n";
		$EXTEN= ($A =~ /\.([\w\*]+)$/) ? "\.$1" : ""; 
		if ($EXTEN) { 
			print "Scanning for $EXTEN ....\n\n";#// //
			$dir = ".";
			$word = $ARGV[1];#\
			$type = $ARGV[2];#\
			print "begin at $dir\nlooking for: $word\n";
		} else {#// //////
			$EXTEN  = "\.vfc"  ; 
			print "Scanning for $EXTEN  ....\n\n"; 
			if ( -d $ARGV[0] )
			{
				$dir = $ARGV[0];
				$word = $ARGV[1];#\
				$type = $ARGV[2];#\
				#$flag = $ARGV[3];
			}else{
				print "default dir\n\n";
				$dir = ".";
				$word = $ARGV[0];#\
				$type = $ARGV[1];#\
				print "begin at [$dir]\nlooking for: $ARGV[0]\n\n";
				#$flag = $ARGV[2];
				}
			}#// //////
	}else{
		print( "\nUseage: @0  [directory=.]  <search term> [vfc_type]\n" ) ;
		print( "\n\tWhere:vfc_type = {input,event,process,set,output,loop,lend,branch,path,bend,end,generic}\n" ) ;
		exit
		}
	#process_files( "$dir" , $word  , $type ) ;
	# // Use glob to get all the files and directories in the path //
	my @list_of_files = glob("$dir/*"); 
	my @list_of_files =  File::Find::Rule->directory->in($dir);
	use File::Find;# ////
	my @safe_dirs;# ////
my $wanted = sub {# ////
	return unless -d;# ////
return if $File::Find::name =~ /\/?build\//;# // skip any build/ //
return if $File::Find::name =~ /\/?CMakeFiles\//;# // skip CMake garbage //
push @safe_dirs, $File::Find::name;# ////
};#// //////
find($wanted, '.');#// //////
# // Debug it: //
#print "$_\n" for @safe_dirs;
my @safe_dirs;# ////
@list_of_dirs = @safe_dirs;# ////
print "\n==============================================================\n"; 
print( "<directory=$dir>  type=<$EXTEN> <search term=$word> <vfc_type=$type>\n" ) ;#//// ////////
print( "\tvfcfind .* \tkeyword - looks for all file types of ANY ext for <keyword>\n" ) ;
print( "\tvfcfind .ext \tkeyword - looks for all file types of .ext for <keyword>\n" ) ;
print( "\tvfcfind  \tkeyword - looks for all VFC files for <keyword>\n" ) ;
print( "\tvfcfind .files \tkeyword - looks for all filenames with <keyword>\n" ) ;
print "==============================================================\n\n"; 
#print "TOP FOLDER ============> $dir\n";
#$lines = process_files( "$dir" , $word , $type ) ;
#print "\t--------------> $dir  :  $lines \n\n";
$TotalLines += $lines;
# // Filter out the directories using the -d file test operator //
my @list_of_dirs = grep { -d } @list_of_files;
foreach my $dir (@list_of_dirs) {
	if ( $dir =~ m/BackupVFC/ || $dir =~ m/BSP_/ || $dir =~ m/build/ || $dir =~ /^\./ )
	{
		#print( "\t\t---->Skipping ... $dir\n"  );
	} else {
		#print "FOLDER==> $dir:\n";
		$lines = process_files( "$dir" , $word , $type , $size ) ;
		$TotalLines += $lines;
		# print "Lines of VFC in $dir  :  $lines \n\n";
		}
	}#// //////

#sleep(5);
print( "\n\n==> <directory=$dir>  type=<$EXTEN> <search term=$word> <vfc_type=$type>\n" ) ; 
print "==> TOTAL SCANNED LOC: $TotalLines :: HITS: $HIT_TOTAL \n"; 

#  Export  Date: 02:07:40 PM - 10:Jul:2025.

