package Forge;

use 5.014002;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);
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
    {id => 1,  name => "A qualifier"},
    {id => 14, name => "A planifier"},
    {id => 7,  name => "En développement"},
    {id => 3,  name => "Réalisé à tester"}
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
