#!/usr/bin/env perl
#file: 07-gc.pl

use strict;
use warnings;
use autodie;

my @array = @ARGV;

if (@array == 0){
	die "Please provide a sequence.\n";
}

for my $sequence (@array) {
    my @bases  = split (//,$sequence);
    my $length = 0;
    my $GC     = 0;

    foreach my $base (@bases) {
        if ( (uc($base) eq "C") or (uc($base) eq "G") ){
            $GC ++;
            
        }
        $length ++;
    }
    print "------\n";
    print "Seq : ", $sequence, "\n";
    print "Length : ", $length, "\n";
    print "#GC : ", $GC, "\n";
    print "%GC : ", $GC / $length * 100 , "\n";
}
