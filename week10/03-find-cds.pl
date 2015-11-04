#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;
use Bio::Seq::RichSeq;

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
    my $file = shift @ARGV or pod2usage('Missing a file');
    for my $file (@ARGV) {
        # say "file ($file)";
        my $seqio_object = Bio::SeqIO->new(-file => $file);
        my $seq_object = $seqio_object->next_seq;
        my $seqio = Bio::SeqIO->new(-file => $file);

        while (my $seq = $seqio->next_seq) {
            my @cds_features = grep { $_->primary_tag eq 'CDS' } 
                               $seq->get_SeqFeatures;
            #say "CDS = ", Dumper(\@cds_features); use Data::Dumper;
            say $seq->id, " has ", scalar(@cds_features), " CDS";

            my $count = 0;
            for my $cds (@cds_features) {
                $count++;
                say $count, ": ", $cds->get_tag_values('translation');
            }
        }
    }
}

# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'help',
        'man',
    ) or pod2usage(2);

    return %args;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

03-find-cds.pl - a script

=head1 SYNOPSIS

  03-find-cds.pl rec.gb [rec2.gb ...] 

Options:

  --help   Show brief help and exit
  --man    Show full documentation

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
