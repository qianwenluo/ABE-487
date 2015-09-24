#!/usr/bin/perl
#file:problem6.pl

use strict;
use warnings;
use autodie;

my $in = 'numbers.txt';
my $out = 'myresult.txt';

open my $in_fh, '<', $in;
open my $out_fh, '>', $out;

while (my $line = <$in_fh>) {
    if ($line % 2 == 0) {
        if ($line < 24) {
            print $line, "\n";
        }
    }
    else {
        my $fac = &fact( $line,1);
        print "factorial: $fac\n";
    }
}
