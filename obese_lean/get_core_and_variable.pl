#!/usr/bin/env perl
#file: get_core_and_variable.pl

use strict;
use warnings;
use autodie;

my %kegg;
open my $core_fh, '>', 'core';
open my $varible_fh, '>', 'varible';

my $file_ct = @ARGV;
for my $file (@ARGV) {
    open my $fh, '<', $file; 

    while (my $line = <$fh>) {
	    chomp($line);
	    my ($k,$count) = split(',', $line);
	    if ($count >= 50){
		    $kegg{$k} ++;
	    }   
    }   
}

for my $k (keys %kegg) {
	if ($kegg{$k} == $file_ct){
	    print $core_fh "$k\n";
    }else {
	    print $varible_fh "$k\n"; }
}

	

