#!/usr/bin/env perl
#file: 04-restriction.pl

use strict;
use warnings;
use autodie;

my $file = shift or die "Please provide a sequence or file.\n";

open my $fh, '<', $file;


while (my $line = <$fh>){
    chomp($line);
    $line =~ s/([AG])(AATT[CT])/$1^$2/g;
    print $line;
}

