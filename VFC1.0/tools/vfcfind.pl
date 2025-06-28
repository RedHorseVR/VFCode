use File::Find;
use File::Basename;
use File::Find::Rule;
$HIT_TOTAL = 0;

sub GetLines{ local ( $filename , $word_to_find  , $type ) = @_;
	open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
	my $line_number = 0;
	$found = 0;
	
	$VFCtoken = "^(generic|variable|input|event|process|set|output|loop|lend|branch|path|bend|end)" ;
	while (my $row = <$fh>) {
		if ( $row =~ m/$VFCtoken/  )
		{
			$line_number++;
			}
		$row =~ s/$VFCtoken// ;
		
		
		$row =~ s/\n// ;
		if($row =~ m/$word_to_find/) {
			if ( $type =~ m/$VFCtoken/  )
			{
				if ( $tok =~ m/^$type/ )
				{
					$found += 1;
					if ( $EXTEN =~ m/vfc/i  )
					{
						print "\tVFC2000 $filename  -Goto $line_number\t|--------> $tok$row;\n";
						}
				}else{
					}
			}else{
				$found += 1;
				if ( $EXTEN =~ m/vfc/i  )
				{
					print "\tVFC2000 $filename  -Goto $line_number\t|--------> $tok$row;\n";
				} else {
					print "\tNOTEPAD $filename      | line: $line_number  -------> $tok$row;\n";
					}
				}
			}
		}
	
	close($fh);
	if ( $found > 0  )
	{
		print "\tVFC LOC: $line_number :: $found HIT(s)\n\n";
		$HIT_TOTAL += $found ;
		}
	return $line_number; }
$EXTEN  = "\.vfc" ;
sub process_files{ my( $dir , $word , $type , $size_args ) = @_;
	opendir(DIR, $dir) or die "Could not open $dir in process_files \n";
	$total_lines  = 0;
	$FIRST_HIT = "True" ;
	while (my $file = readdir(DIR)) {
		if ( $file =~ m/$EXTEN$/ &&   -f "$dir/$file") {
			
			
			$VFCfile = "$dir\\$file" ;
			$VFCfile  =~ s/\\\//\\/;
			
			$ROOT = basename( $VFCfile ) ;
			if ( $VFCfile =~ m/$EXTEN$/i  && (   ".vfc" =~ m/$EXTEN$/i   ||  $ROOT !~ /^[_]/ ) )
			{
				$VFCfile =~ tr|/|\\|;
				if ( ".vfc" =~ /$EXTEN/i ) {  print "explorer $VFCfile\n"; }
				$lines = GetLines( $VFCfile , $word , $type  ) ;
				
				$total_lines  += $lines ;
				
				}
			}
		}
	
	closedir(DIR);
	return $total_lines  ;   }
#main
	
	my $dir = "";
	my $word = "";
	my $size = $#ARGV + 1;
	print "The size of \@ARGV is $size\n";
	if ( $size >=  1) {
	
		$A = $ARGV[0] ;
		$A1 = $ARGV[1] ;
		$A2 = $ARGV[2] ;
		print "args: $A, $A1, $A2 --- @ARGV \n";
		$EXTEN= ($A =~ /\.(\w+)$/) ? "\.$1" : "";
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
		print( "\nUseage: @0  [directory=.]  <search term> [vfc_type]\n" ) ;
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

print "$_\n" for @safe_dirs;
my @safe_dirs;
@list_of_dirs = @safe_dirs;
print "\n==============================================================\n";
print( "<directory=$dir>  <search term=$word> <vfc_type=$type>\n" ) ;
print "==============================================================\n\n";



$TotalLines += $lines;

my @list_of_dirs = grep { -d } @list_of_files;
foreach my $dir (@list_of_dirs) {
	if ( $dir =~ m/BackupVFC/ || $dir =~ m/BSP_/ || $dir =~ m/build/ )
	{
		
	} else {
		
		$lines = process_files( "$dir" , $word , $type , $size ) ;
		$TotalLines += $lines;
		
		}
	}

print "\n==> TOTAL VFC LOC: $TotalLines :: HITS: $HIT_TOTAL \n";

#  Export  Date: 02:46:59 PM - 28:Jun:2025.

