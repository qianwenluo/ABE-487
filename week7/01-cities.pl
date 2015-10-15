#!/usr/bin/env perl
#file: 01-cities.pl

use strict;
use warnings;
use Data::Dumper;

my %cities = (
    'Guangzhou' => 'GZ',
    'Wuhan' => 'HB',
    'Tucson' => 'AZ',
    'Beijing' => 'BJ'
    );
print Dumper(\%cities);

my $count = 0;
foreach my $city (sort { uc $a cmp uc $b } keys %cities) {
    my $state = $cities{$city};
    $count ++;
    print $count, ": ", $city,", ", $state, "\n";    
    
}


