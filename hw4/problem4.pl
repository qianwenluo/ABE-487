#!/usr/bin/perl
#file:problem4.pl

use strict;
use warnings;

my $in = 'Perl_III.fastq.txt';

open my $in_fh, '<',$in;

my $lc = 0;
my $size = 0;
my $al = 0;
while (my $line = <$in_fh>) {
    chomp $line;
    $lc++;
    $size += length($line);
    $al = $size / $lc;
    
}
print "There are $lc lines.\n";
print "There are $size characters.\n";    
print "The average line length is $al.\n";    
