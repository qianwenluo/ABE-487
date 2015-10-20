#!/usr/bin/env perl
#file: 02-nobody.pl

use strict;
use warnings;

while (my $line = <DATA>) {
	chomp $line;
    my $h = "Nobody";
	my $word = shift || 'Geroge';
	$h =~ s/w.+f/$word/;
    print $h, "\n";
}

__DATA__
Nobody by Shel Silverstein
Nobody loves me,
Nobody cares,
