#!/usr/bin/env perl
#file: project.pl

use strict;
use warnings;
use autodie;
use feature 'say';
use File::Basename 'basename';

@ARGV or die "No input files.\n";

my (%uniq_prot, %uniq_sample);
for my $file(@ARGV) {
    open my $fh, '<', $file;
    my $sample = basename($file, '.uproc');
    $uniq_sample{ $sample }++;
    
    while (my $line = <$fh>) {
        chomp($line);
        my ($prot, $count) = split(',', $line);
        $uniq_prot{$prot}{$sample} = $count;    
    }
}

#use Data::Dumper;
#say Dumper(\%uniq_prot);
#say Dumper(\%uniq_sample);

my @samples = sort keys %uniq_sample;
say join "\t", 'protein', @samples;
for my $prot (sort keys %uniq_prot)  {
    my @vals;
    for my $sample (@samples) {
        push @vals, $uniq_prot{$prot}{$sample} || 0;
    }

    say join "\t", $prot, @vals;
}

__END__

my @print;
my $count;
my $file;
my $ko;
for my $ko (keys %uniq_ko) {
    my @print = ($ko);
    my $count = %uniq_ko;

    for my $ko @file {
        if (exists $uniq_ko {$ko} {$file} {
         $count = $uniq_ko {$ko} {$file};
         push (@print, $count);   
        }
    }
}
print @print;
