use File::Find;
use File::Basename;
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
		$tok = $& ;
		$row =~ s/;\/\/.*// ;
		$row =~ s/\n// ;
		if($row =~ m/$word_to_find/) {
		
			if ( $type =~ m/$VFCtoken/  )
			{
				if ( $tok =~ m/^$type/ )
				{
					$found += 1;
					print "\tVFC2000 $filename  -Goto $line_number\t|--------> $tok$row;\n";
				}else{
					}
			}else{
				$found += 1;
				print "\tVFC2000 $filename  -Goto $line_number  |--------> $tok$row;\n";
				}
			}
		}
	
	close($fh);
	if ( $found > 0  )
	{
		print "\tLOC: $line_number :: $found HIT(s)\n\n";
		$HIT_TOTAL += $found ;
		}
	return $line_number; }
sub process_files{ my( $dir , $word , $type  ) = @_;
	opendir(DIR, $dir) or die "Could not open $dir in process_files \n";
	$total_lines  = 0;
	while (my $file = readdir(DIR)) {
		if ( $file =~ m/\.dart\.vfc/ &&   -f "$dir/$file") {
		
			$VFCfile = "$dir\\$file" ;
			$VFCfile  =~ s/\\\//\\/;
			if ( $VFCfile =~ m/\.vfc$/ )
			{
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
	if ( $size >=  2) {
	
		$dir = $ARGV[0];
		$word = $ARGV[1];
		$type = $ARGV[2];
	}else{
		print( "Useage: @0  <directory>  <search term> <vfc_type>\n" ) ;
		exit
		}
	
	
	my @list_of_files = glob("$dir/*");
	$TotalLines = 0;
	print "\n===============================\n";
	print( "<directory=$dir>  <search term=$word> <vfc_type=$type>\n" ) ;
	print "===============================\n\n";
	print "\t============> $dir\n";
	$lines = process_files( "$dir" , $word , $type ) ;
	
	$TotalLines += $lines;
	
	my @list_of_dirs = grep { -d } @list_of_files;
	foreach my $dir (@list_of_dirs) {
		if ( $dir =~ m/BackupVFC/ )
		{
		} else {
			print "\t============> $dir \t============\n";
			$lines = process_files( "$dir" , $word , $type ) ;
			$TotalLines += $lines;
			
			}
		}
	
	print "--------------> \n";
	print "--------------> TOTAL LOC: $TotalLines :: HITS: $HIT_TOTAL \n";
	print "--------------> \n";
	
#  Export  Date: 12:21:28 PM - 24:Jan:2024.

