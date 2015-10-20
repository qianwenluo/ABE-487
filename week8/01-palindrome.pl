#!/usr/bin/env perl
#file: 01-palindrome.pl

use strict;
use warnings;
use feature 'say';

my $line = shift or die "Please provide a word or phrase.\n";

chomp ($line);
$line =~ s/[^A-Za-z0-9]//g;
#say "line ($line)";

if (uc $line eq reverse uc $line) {
    print "Yes\n";
}   
else {
    print "No\n";
}
