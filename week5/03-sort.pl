#!/usr/bin/env perl
#file: 03-sort.pl

use strict;
use warnings;
use autodie;

my @numbers = @ARGV;

if (@numbers == 0){
	die "Please provide a list of numbers.\n";
}

my @default_sort = sort (@numbers);
print "default sort = ", join (', ', @default_sort), "\n";

my @numerical_sort = sort ( { $a <=> $b } @numbers);
print "numerical sort = ", join (', ', @numerical_sort), "\n";

my @reverse_numerical_sort = sort ( { $b <=> $a } @numbers);
print "reverse numerical sort = ", join (', ', @reverse_numerical_sort), "\n";



