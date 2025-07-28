use File::Find;
use File::Basename;
use File::Find::Rule;
$HIT_TOTAL = 0;

my $ps;
sub start_powershell {
	return if $ps;

open($ps, '|-', 'powershell -Command -') or die "Can't start PowerShell: $!";
select((select($ps), $| = 1)[0]);
}
sub cprint {
	my ($text, $color) = @_;
	
	start_powershell();
	
	$text =~ s/'/'\''/g;
	
	print $ps "Write-Host '$text' -ForegroundColor $color\n";
	}
$default = "\e[0m" ;
my $reset     = "\e[0m";
my $bold      = "\e[1m";
my $black     = "\e[30m";
my $red       = "\e[31m";
my $green     = "\e[32m";
my $yellow    = "\e[33m";
my $blue      = "\e[34m";
my $magenta   = "\e[35m";
my $cyan      = "\e[36m";
my $white     = "\e[37m";

my $bright_red     = "\e[1;31m";
my $bright_green   = "\e[1;32m";
my $bright_yellow  = "\e[1;33m";
my $bright_blue    = "\e[1;34m";
sub GetLines{ local ( $filename , $word_to_find  , $type ) = @_;
	open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
	my $line_number = 0;
	$found = 0;
	
	$VFCtoken = "^(generic|variable|input|event|process|set|output|loop|lend|branch|path|bend|end)" ;
	while (my $row = <$fh>) {
		
		$row =~ s/\x1B[\(\)][0-9A-Za-z]*//g;
		$row =~ s/[^\x20-\x7E\r\n\t]//g;
		if ($row =~ /[^\x00-\x7F]/   || $row =~ m/\x/ )
		{
			next ;
			
		} else {
			}
		$line_number++;
		if(  $EXTEN =~ m/vfc/i  ) { $row =~ s/$VFCtoken// } ;
		
		
		$row =~ s/\n// ;
		if($row =~ m/$word_to_find/) {
			if ( $type =~ m/$VFCtoken/  &&  $EXTEN =~ m/vfc/i   )
			{
				if ( $tok =~ m/^$type/ )
				{
					$found += 1;
					if ( $EXTEN =~ m/vfc/i  )
					{
						
						print "\tvfc $filename  $line_number\t$default|--------> $tok$row;\n";
						}
				}else{
					}
			}else{
				$found += 1;
				if ( $EXTEN =~ m/vfc/i  )
				{
					
					cprint( "\tvfc $filename  $line_number\t$default|---- $EXTEN ----> $tok$row;" , 'red'  );
				} else {
					if (-e "$filename.vfc" )
					{
						
						cprint ( "\tvfc $filename   $line_number\t$default| line: $line_number  ---$EXTEN ----> $tok$row", 'cyan' );
					} elsif( $filename !~ /\.vfc$/ ) {
						
						cprint ( "\tvfc $filename   $line_number\t$default| line: $line_number  ---$EXTEN ----> $tok$row" , 'yellow'  );
						}
					}
				}
			}
		
		}
	
	close($fh);
	if ( $found > 0  )
	{
		print "\n\tVFC LOC: $line_number :: $found HIT(s)\n\n";
		$HIT_TOTAL += $found ;
		}
	return $line_number; }
$EXTEN  = "\.vfc" ;
sub process_files{ my( $dir , $word , $type , $size_args ) = @_;
	opendir(DIR, $dir) or die "Could not open $dir in process_files \n";
	$total_lines  = 0;
	$FIRST_HIT = "True" ;
	while (my $file = readdir(DIR)) {
		
		if ( $EXTEN =~ m/files/ )
		{
			
			if ( $file =~ m/$word/ && $file !~ m/^_/ &&  $file !~ m/\.vfc$/ )
			{
				if (-e "$dir/$file.vfc" )
				{
					print "-->";
				}else{
					
					}
				print ( "\tvfc $dir/$file  \n" );
			} else {
				}
		}else{
			if ( ( $file =~ m/$EXTEN$/i  ||  '*' =~ m/$EXTEN$/i   ) &&   -f "$dir/$file") {
				
				
				$VFCfile = "$dir\\$file" ;
				$VFCfile  =~ s/\\\//\\/;
				
				$ROOT = basename( $VFCfile ) ;
				if (  (  $ROOT !~ /^[_]/ ) )
				{
					$VFCfile =~ tr|/|\\|;
					if ( ".vfc" =~ m/$EXTEN/i   &&  ".*" !~ m/$EXTEN/i   )
					{
						print "$bright_blue";
						print "vfc2000 $VFCfile\n";
						print "$default";
						}
					$lines = GetLines( $VFCfile , $word , $type  ) ;
					
					$total_lines  += $lines ;
					
					}
				}
			}
		}
	
	closedir(DIR);
	return $total_lines  ;   }
#main
	use Cwd;
	
	my $dir = "";
	my $word = "";
	my $size = $#ARGV + 1;
	print "The size of \@ARGV is $size\n";
	if ( $size >=  1) {
	
		$A = $ARGV[0] ;
		$A1 = $ARGV[1] ;
		$A2 = $ARGV[2] ;
		print "args: $A, $A1, $A2 --- @ARGV \n";
		$EXTEN= ($A =~ /\.([\w\*]+)$/) ? "\.$1" : "";
		if ($EXTEN) {
			print "Scanning for $EXTEN ....\n\n";
			$dir = ".";
			$word = $ARGV[1];
			$type = $ARGV[2];
			print "begin at $dir\nlooking for: $word\n";
		} else {
			$EXTEN  = "\.vfc"  ;
			print "Scanning for $EXTEN  ....\n\n";
			if ( -d $ARGV[0] )
			{
				$dir = $ARGV[0];
				$word = $ARGV[1];
				$type = $ARGV[2];
				
			}else{
				print "default dir\n\n";
				$dir = ".";
				$word = $ARGV[0];
				$type = $ARGV[1];
				print "begin at [$dir]\nlooking for: $ARGV[0]\n\n";
				
				}
			}
	}else{
		
		print( "\nUseage: @0  [directory=$cdw]  <search term> [vfc_type]\n" ) ;
		print( "\n\tWhere:vfc_type = {input,event,process,set,output,loop,lend,branch,path,bend,end,generic}\n" ) ;
		exit
		}
	
	
	my @list_of_files = glob("$dir/*");
	my @list_of_files =  File::Find::Rule->directory->in($dir);
	use File::Find;
	my @safe_dirs;
my $wanted = sub {
	return unless -d;
return if $File::Find::name =~ /\/?build\//;
return if $File::Find::name =~ /\/?CMakeFiles\//;
push @safe_dirs, $File::Find::name;
};
find($wanted, '.');


my @safe_dirs;
@list_of_dirs = @safe_dirs;
print "\n==============================================================\n";
my $cwd = getcwd();
print( "Curent directory: $cwd \n" );
print "\n==============================================================\n";
print( "<directory=$dir>  type=<$EXTEN> <search term=$word> <vfc_type=$type>\n" ) ;
print( "\tvfcfind .* \tkeyword - looks for all file types of ANY ext for <keyword>\n" ) ;
print( "\tvfcfind .ext \tkeyword - looks for all file types of .ext for <keyword>\n" ) ;
print( "\tvfcfind  \tkeyword - looks for all VFC files for <keyword>\n" ) ;
print( "\tvfcfind .files \tkeyword - looks for all filenames with <keyword>\n" ) ;
print "==============================================================\n\n";



$TotalLines += $lines;

my @list_of_dirs = grep { -d } @list_of_files;
foreach my $dir (@list_of_dirs) {
	if ( $dir =~ m/BackupVFC/ || $dir =~ m/BSP_/ || $dir =~ m/build/ || $dir =~ /^\./ )
	{
		
	} else {
		
		$lines = process_files( "$dir" , $word , $type , $size ) ;
		$TotalLines += $lines;
		
		}
	}


print( "\n\n==> <directory=$dir>  type=<$EXTEN> <search term=$word> <vfc_type=$type>\n" ) ;
print "==> TOTAL SCANNED LOC: $TotalLines :: HITS: $HIT_TOTAL \n";

#  Export  Date: 12:03:29 PM - 28:Jul:2025.

