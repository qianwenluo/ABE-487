#!/usr/bin/env perl
#file: 03-fasta.pl

use strict;
use warnings;

my $file = shift or die "Please provide a FASTA file.\n";

open my $fh, '<', $file;

my $count = 0;
while (my $line = <$fh>) {
	chomp($line);
		
	$count ++;
	printf "%6d: %s\n", 
	print "Found ", $count, " sequences\n";
}
