#!/usr/bin/env perl
#file: 03-fasta.pl

use strict;
use warnings;
use feature 'say';

my $file = shift or die "Please provide a FASTA file.\n";

open my $fh, '<', $file;

my $count = 0;
while (my $line = <$fh>) {
	chomp($line);
	#if(substr ($line,0,1) eq '>'){

    if ($line =~ /^>(.+)/) {
        $count++;
        say "$count: $1";
	}

}
printf "Found $count sequence%s.\n", ($count == 1) ?  '' : 's';
