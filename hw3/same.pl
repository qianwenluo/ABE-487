#!/usr/bin/perl
#file: same.pl

use strict;
use warnings;

my $var1 = shift;
my $var2 = shift;

if ( !defined($var1) or !defined($var2) ) {
    print "Please provide two strings.\n";
}
elsif ( lc($var1) eq lc($var2) ) {
    print "same\n";
}
else {
    print "different\n";
}
