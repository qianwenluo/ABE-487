#!/usr/bin/env perl
#file:problem6.pl

use strict;
use warnings;
use autodie;

my $in = 'numbers.txt';
my $out = 'myresult.txt';

open my $in_fh, '<', $in;
open my $out_fh, '>', $out;

while (my $n = <$in_fh>) {
    chomp($n);
    next unless $n;
    if ($n % 2 == 0) {
       if ($n <= 24) {
         chomp($n);
         print $n, "\n";
       }
    }
    else {
        my $factorial = 1;
        
        for (my $i = 1; $i <= $n; $i++){
            $factorial *= $i;
        }
        
        print $out_fh $factorial, "\n";
    }
}
