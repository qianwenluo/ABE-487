#!/usr/bin/perl
#file:problem1.pl
use strict;
use warnings;

my $x = shift;
my $y = shift;

if (! defined ($x) or ! defined ($y)) {
    print STDERR "Two numbers are required\n";
} elsif ($x < 0 or $y < 0) {
    print STDERR "Two numbers have to be positive\n";
} elsif ($y == 0) {
    print STDERR "The divisor cannot be zero\n";
} else {
    print $x / $y, "\n";
}
