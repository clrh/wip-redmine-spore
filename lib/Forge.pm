package Forge;

use 5.014002;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);
our %EXPORT_TAGS = ( 'all' => [ qw(
 count_issues
 count_issues_by_status
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
  count_issues
  count_by_status
);

our $VERSION = '0.01';

sub count_issues {
  my $issues = shift;
  my @ids;
  my $issue;
  foreach $issue ( @{$issues->{issues}} ) {
    push @ids, $issue->{id};
  }
  $#ids + 1;
}

sub count_by_status {
  my $issues = shift;
  my @lists = (
    {id=>1, name=>"A qualifier"},
    {id=>14, name=>"A planifier"},
    {id=>7, name=>"En développement"},
    {id=>3, name=>"Réalisé à tester"}
  );
  my $aqual;my $aplan; my $endev; my $atest;
  foreach my $issue ( @{$issues->{issues}} ) {
	  my $status_id = $issue->{status}->{id};
          $aqual += 1 if ($status_id eq 1);
          $aplan += 1 if ($status_id eq 14);
          $endev += 1 if ($status_id eq 7);
          $atest += 1 if ($status_id eq 3);
  }
  my %count_issues_by_status = (
    1  => $aqual,
    14 => $aplan,
    7  => $endev,
    3  => $atest,
  );
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Forge - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Forge;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Forge, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

A. U. Thor, E<lt>clrh@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014 by A. U. Thor

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
