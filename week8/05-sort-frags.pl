#!/usr/bin/env perl
#file:05-sort-frags.pl

use strict;
use warnings;
use Data::Dumper;
use feature 'say';

my @strings;
while (my $line = <>) {
    push @strings, split(/\^/,$line);
}

say join "\n", sort {length($a) <=>length($b)} @strings;
