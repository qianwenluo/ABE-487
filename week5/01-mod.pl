#!/usr/bin/perl
#file: 01-mod.pl

use strict;
use warnings;
use autodie;


my @numbers = @ARGV;

if (@numbers  == 0){
    die "Please procide a list of numbers.\n";
} 

# declare an array for evens
my @evens;
foreach my $number (@numbers) {
    if ($number % 2 == 0) {
        # add $number to some array
        push @evens, $number
    }
}
# print the evens here
print "evens = ", join (', ', @evens), "\n";

