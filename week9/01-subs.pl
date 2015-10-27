#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Data::Dumper;

main();

# --------------------------------------------------
sub main {
    my %args = get_args();
   
    if ($args{'help'} || $args{'man_page'}) {
        pod2usage({
            -exitval => 0,
            -verbose => $args{'man_page'} ? 2 : 1
        });
    }; 
    #say Dumper (\%args);
    #say "OK";
    my $program = $args{'program'} or pod2usage('Missing program');
    my $args = $args{'argument'} or pod2usage('Missing argument');    

    if($program eq 'hello') {
        hello($args{'argument'});
    }
    elsif($program eq 'rc') {
        rc($args{'argument'});
    }
}

# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'program=s',
        'argument=s',
        'help',
        'man_page',
    ) or pod2usage(2);

    return %args;
}

# -------------------------------------------------
sub hello {
    my $name = shift;
    say "Hello, ", $name;
}

sub rc {
    my $seq = shift;
    my $revcomp = reverse($seq);
    $revcomp =~ tr/ACGTacgt/TGCAtgca/;
    say $revcomp
}
__END__

# --------------------------------------------------

=pod

=head1 NAME

01-subs.pl - subroutine practice

=head1 SYNOPSIS

  01-subs.pl -p hello -a Tucson
  
  01-subs.pl -p rc -a GAGAGAGAGAGTTTTTTTTT


Options:

  --program   The thing to do
  --argument  The argument to the thing
  --help      Show brief help and exit
  --man       Show full documentation

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
