#!/usr/bin/perl
# file:problem5.pl

use strict;
use warnings;
use autodie;

my $in = 'Perl_III.nobody.txt';

open my $in_fh, '<', $in;

while (my $line = <$in_fh>) {
    print $line;
    chomp($line);
    my $fn = index($line, 'Nobody');
    my $fs = index($line, 'somebody');

    if ($fn >= 0) {
        print "My first position of 'Nobody' on this line is:$fn \n";
    }

    if ($fs >= 0) {
        warn ("Somebody is here: $fs\n");
    }    
}
