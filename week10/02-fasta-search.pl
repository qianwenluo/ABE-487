#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;
use Bio::DB::Fasta;

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

    unless (@ARGV == 2) {
        pod2usage();
    }

    my ($file,$pattern) = @ARGV;
    #say "file ($file)";
    my $db   = Bio::DB::Fasta->new($file);
    #say join "\n", grep { /$pattern/ } $db->get_all_primary_ids;
    say "Searching '$file' for '$pattern'";
    my @ids    = grep {/$pattern/} $db->get_all_primary_ids;
    
    my $count  = scalar(@ids);;
    say "Found $count ids.";

    if ($count > 0) {
        (my $filename = $pattern) =~ s/\W//g;
        $filename .= '.fa';
        my $writer = Bio::SeqIO->new(-file => ">$filename",
                                     -format => 'Fasta');
        for my $id (@ids) {
            if ( my $seq = $db->get_Seq_by_id($id) ) {
                $writer->write_seq($seq);
            }
        }     
        say "See results in $filename.";
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

02-fasta-search.pl 

=head1 SYNOPSIS

  02-fasta-search.pl file.fa pattern

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
