#!/usr/bin/env perl
#file: 02.pl

use strict;
use warnings;
use autodie;

my @numbers = @ARGV;

if (@numbers == 0) {
    die "Please provide a list of numbers.\n";
}

my $even_sum = 0;
my $odd_sum = 0;

foreach my $number (@numbers) {
    if ($number % 2 == 0) {
        $even_sum += $number;
    }
    else {
        $odd_sum += $number;
    }
}
print "sum evens = ", join(', ',$even_sum), "\n";
print "sum odds = ", join(', ',$odd_sum), "\n";


