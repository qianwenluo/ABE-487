#!/usr/bin/perl
#file:order.pl

use strict;
use warnings;

my $var1 = shift;
my $var2 = shift;

if (defined ($var1) && defined ($var2)){
  my $val = $var1 cmp $var2;
  if ($val <= 0) {
    print "Right order\n";
  }
  else {
    print "wrong order\n";
  }
}
