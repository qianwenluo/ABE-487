#!/usr/bin/env perl
#file: 02-fasta-hash.pl

use strict;
use warnings;
use autodie;
use Data::Dumper;
use feature 'say';

my $in = shift || 'Perl_V.genesAndSeq.txt';

#say "in ($in)";

open my $in_fh, '<', $in;

my %sequences;
my $id = '';

while (my $line = <$in_fh>) {
    chomp ($line);

    if (substr($line,0,1) eq '>') {
        $id = substr($line, 1);
        $sequences{$id} = 0;
    }
    else {
       # say "$id = ", length($line);
       $sequences{$id} += length($line);
    }
}
for my $var (sort { $sequences{$a} <=> $sequences{$b} } keys %sequences) {
    say "$var: $sequences{$var}";
}

#say Dumper(\%sequences);


