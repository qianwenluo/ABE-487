#!/usr/bin env perl
#file: 04-kmer-count.pl

use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

my $seq       = shift or die "Please provide a sequence.\n";
my $kmer_size = shift || 3;

if (-e $seq) {
    open my $fh, '<', $seq;
    $seq = join '', <$fh>; 
}

unless ($seq) {
    die "Zero-length sequence.\n";
}

if (length($seq) < $kmer_size){
    die "Cannot get any $kmer_size mers from a sequence of length ", length($seq), "\n";
}

my $num_kmers = length($seq) - $kmer_size +1; 

my %kmers;
my $kmer;
for (my $i = 0; $i < $num_kmers; $i ++){
    $kmer = substr($seq, $i, $kmer_size);
    $kmers{$kmer} ++;
}
#say Dumper(\%kmers);

my $count   = scalar(keys %kmers);
my $nsingle = scalar( grep { $_ == 1 } values %kmers); 

printf "%-15s %10s\n", "Sequence length", length($seq);
printf "%-15s %10s\n", "Mer size ", $kmer_size;
printf "%-15s %10s\n", "Number of kmers", $num_kmers;
printf "%-15s %10s\n", "Unique kmers", $count;
printf "%-15s %10s\n", "Num. singletons", $nsingle;
if ($nsingle < $count) {
    my $i = 0;
    say "Most abundant";
    foreach my $kmer (
        sort {$kmers{$b} <=> $kmers{$a} || $a cmp $b } keys %kmers
    ) {
        my $count = $kmers{$kmer};
        last if $count <= 1;
        $i++;
        last if $i > 10;
        say $kmer, ": ", $count;
    }
}
