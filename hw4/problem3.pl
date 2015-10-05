#!/usr/bin/env perl
#file:problem3.pl

use strict;
use warnings;
use autodie;

my $in = 'Perl_III.fasta.txt';
my $out = 'out.txt';

open my $in_fh, '<', $in;

my $rev = 0;
while (my $line = <$in_fh>) {
    chomp($line);		

    if (substr($line, 0, 1) eq '>') {
        print $line, " (This is the reverse complement)\n";
    } else {
        my $revcomp = reverse($line);
        $revcomp =~ tr/ACGTacgt/TGCAtgca/;
        print  $revcomp, "\n";
    }
}


