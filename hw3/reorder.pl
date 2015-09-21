#!/usr/bin/perl
#file:reorder.pl

use strict;
use warnings;

my $var1 = shift;
my $var2 = shift;

if (defined($var1) && defined($var2)){
    my $val = $var1 cmp $var2;
    if ($val < 0){
     print "$var1 $var2\n";
    }
    else {
     print "$var2 $var1\n";
}
}
