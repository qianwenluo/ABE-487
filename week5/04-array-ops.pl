#!/usr/bin/env perl
#file: 04-array-ops.pl

use strict;
use warnings;
use autodie;

my @array = (101, 2, 15, 22, 95, 33, 2, 27, 72, 15, 52);
print "array = ",join (', ', @array), "\n";

my $pop = pop (@array);
print "popped = ", $pop, ", ", "array = ", join (', ', @array), "\n";

my @new_array;
my $shift = shift ( @array);
push @new_array, @array;
print "shifted = ", $shift, ", ", "array = ", join (', ',@array), "\n";

push (@new_array, '12');
print "after push, array = ", join (', ', @new_array), "\n";

unshift(@new_array, '4');
print "after unshift, array = ", join (', ', @new_array), "\n"; 


