#!/usr/bin/env perl
#file: 06-string-sort-len.pl

use strict;
use warnings;
use autodie;

my @sequences = @ARGV;

if (@sequences == 0){
	die "Please provide a list of sequences.\n";
}

my @sorted = sort ( { length($a) <=> length($b) } @sequences);
print "sorted = ", join (', ', @sorted), "\n";

my @reverse = sort ( { length($b) <=> length($a) } @sequences);
print "reverse = ", join (', ', @reverse), "\n";


