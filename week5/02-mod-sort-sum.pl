#!/usr/bin/perl
#file: 02.pl

use strict;
use warnings;
use autodie;

my @numbers = @ARGV;

if (@numbers == 0) {
    die "Please provide a list of numbers.\n";
}

my @evens;
my @odds;
my $even_sum = 0;
my $odd_sum = 0;

foreach my $number (@numbers) {
    if ($number % 2 == 0) {
        push @evens, $number;
        $even_sum += $number;
    }
}
foreach my $number(@numbers) {
    if ($number % 2 == 1) {
        push @odds, $number;
        $odd_sum += $number;
    }
}
print "sum evens = ", join(', ',$even_sum), "\n";
print "sum odds = ", join(', ',$odd_sum), "\n";


