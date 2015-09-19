#!/usr/bin/perl
#file: percent.pl

use strict;
use warnings;
use feature 'say';

my $i = shift;
my $j = shift;

if (! defined ($i) or ! defined ($j)) {
 say "Please provide two numbers.";
} elsif ($i <0 or $j <0) {
 say "You are trying to trick me!";
} else {
 #say $i/($i+$j) * 100, '%';
printf "%.02f%%\n", $i/($i+$j) * 100 ;
}
