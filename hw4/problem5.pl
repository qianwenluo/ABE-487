#!/usr/bin/perl
# file:problem5.pl

use strict;
use warnings;
use autodie;

my $in = 'Perl_III.nobody.txt';

open my $in_fh, '<', $in;

my $fn = 0;
my $fs = 0;
while (my $line = <$in_fh>) {
    chomp($line);
    $ fn = index($line, 'Nobody');
    $ fs = index($line, 'somebody');
    print "My first position of 'Nobody' on $fn \n";
    warn "My first postion of 'somebody' on $fs \n";    
}
