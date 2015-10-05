#!/usr/bin/env perl
#file:problem2.pl

use strict;
use warnings;
use autodie;

my $file = 'in.txt';
my $out  = 'out.txt';

open my $in_fh, '<', $file;
open my $out_fh, '>', $out;

while (my $line = <$in_fh>) {
    print $out_fh uc $line;
} 
 




