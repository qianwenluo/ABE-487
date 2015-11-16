#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Cwd 'cwd';
use File::Spec::Functions 'catfile';
use File::Basename 'basename';
use File::Path 'make_path';
use Bio::SeqIO;
main();

# --------------------------------------------------
sub main {
    my %args = get_args();

    if ($args{'help'} || $args{'man_page'}) {
        pod2usage({
            -exitval => 0,
            -verbose => $args{'man_page'} ? 2 : 1
        });
    } 

    @ARGV or pod2usage("Need FASTA file(s)");

    my $max     = $args{'number'} || 500;
    my $out_dir = $args{'out_dir'} || cwd();

    unless (-d $out_dir) {
        make_path($out_dir);
    }
   
    for my $file (@ARGV) {
        say "file ($file)";
        my $in = Bio::SeqIO->new(-file => $file,
                                 -format => 'Fasta');
        my $count;
        my $filenum = 0;
        my $writer;
        while ( my $seq = $in->next_seq() ) {
            $count++;
            if (!$writer || $count == $max) {
                $count = 0;
                my $out = catfile($out_dir, basename($file) . "." . ++$filenum);
                say $out; 
                $writer = Bio::SeqIO->new(-file => ">$out",
                                          -format => 'Fasta');
            }   
 
            #say join ": ", $count, $seq->id;
            $writer->write_seq($seq);
        }
    }

    say "Done.";
}

# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'number:i',
        'out_dir:s',
        'help',
        'man',
    ) or pod2usage(2);

    return %args;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

01-fasta-splitter.pl - a script

=head1 SYNOPSIS

  01-fasta-splitter.pl -n 10 -o split file1.fa [file2.fa ...]

Options:

  --number  The maxmimum number of seqences per file (500)
  --out_dir Output directory (cwd)
  --help    Show brief help and exit
  --man     Show full documentation

=head1 DESCRIPTION

Describe what the script does, what input it expects, what output it
creates, etc.

=head1 SEE ALSO

perl.

=head1 AUTHOR

Qianwen Luo E<lt>qianwenluo@email.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 qianwenluo

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut
