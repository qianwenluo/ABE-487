#!/user/bin/perl
#file: add.pl
use strict;
use warnings;
my $x = shift;
my $y = shift;

if (defined($x) && defined($y) && $x > 0 && $y > 0) {
     print "x = '$x', y = '$y'\n";
     print $x + $y, "\n";
} else {
     print "Pledse provide two positive numbers.\n";
}
