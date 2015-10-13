#!/usr/bin/env perl
#file: 08-snps.pl

use strict;
use warnings;
use autodie;

if (@ARGV != 2) {
    die "Please provide two sequences.\n";
}

my ($seq1, $seq2) = @ARGV;

if (length($seq1) != length($seq2)){
	die "Please ensure the sequences are the same length.\n";
}

my $count = 0;
 
for (my $i = 0; $i < length($seq1); $i++) {
    my $s1 = substr($seq1, $i, 1);
    my $s2 = substr($seq2, $i, 1);
   # print "i ($i), s1 ($s1), s2 ($s2)\n";

    if ($s1 ne $s2) {
        print "Pos ", $i+1, ": ", $s1, " => ", $s2, "\n";
        $count++;
    }
}

printf "Found %s SNP%s.\n", $count, ($count == 1) ? '' : 's';
