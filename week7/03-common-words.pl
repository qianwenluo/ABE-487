#!/usr/bin/env perl
#file: 03-common-words.pl

use strict;
use warnings;
use autodie;
use Data::Dumper;

unless (@ARGV == 2) {
    die "Please provide two files.\n";
}

my $in1 = shift;
my $in2 = shift;

open my $in_fh1, '<', $in1;
open my $in_fh2, '<', $in2;

my %file1;
while (my $line1 = <$in_fh1>) {
    chomp ($line1);
    my @file1 = split /\s+/, $line1;
    for my $word1 (@file1) {
        $word1 =~ s/[^A-Za-z0-9]//g; 
        $file1{lc $word1} = 1;
    }
}

#print Dumper(\%file1);


my %file2;
while (my $line2 = <$in_fh2>) {
    chomp($line2);
    my @file2 = split /\s+/, $line2;
    for my $word2 (@file2) {
        $word2 =~ s/[^A-Za-z0-9]//g;
        $file2{lc $word2} = 1;
    }
}

#print Dumper(\%file2);
my $count = 0;
for my $word1(sort keys %file1){
    if (exists $file2{$word1}){
        $count ++;
        print $word1, "\n";
    }
}
print "Found ", $count, " words in common.\n";

