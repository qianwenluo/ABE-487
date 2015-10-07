#!/usr/bin/env perl
#file: 05-string-sort.pl

use strict;
use warnings;
use autodie;

my @sequences = @ARGV;

if (@sequences == 0){
	die "Please provide a list of sequences.\n";
}

my @sorted = sort ( {$a cmp $b} @sequences);
print "sorted = ", join (', ', @sorted), "\n";

my @reverse = sort ( {$b cmp $a} @sequences);
print "reverse = ", join (', ', @reverse), "\n";
