#!/usr/bin/perl
#file: add.pl
use strict;
use warnings;
my $x = shift;
my $y = shift;

if ( !defined($x) or !defined($y) ) {
    print "please provide two numbers\n";
}
elsif ( $x < 0 or $y < 0 ) {
    print "Please provide two positive numbers\n";
}
else {
    print $x + $y, "\n";
}
