#!/usr/bin/perl

use strict;
use Test::More;
use JSON;
use Data::Dump qw/dump/;
use Data::Dumper qw/Dumper/;

sub read_file_and_decode {
  my $filename = shift;
  my $json_text = do {
     open(my $json_fh, "<:encoding(UTF-8)", $filename)
        or die("Can't open \$filename\": $!\n");
     local $/;
     <$json_fh>
  };

  my $json = JSON->new;
  $json->decode($json_text);
}

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

my $filename = './t/fixtures/issues.mock.json';
my $issues = read_file_and_decode $filename;
is (count_issues($issues),25,'number of issues');

my $filename = './t/fixtures/issues-full.mock.json';
my $issues = read_file_and_decode $filename;
is (count_issues($issues),58,'number of issues');
my %sorted_issues = count_by_status($issues);
is ($sorted_issues{7},3,'number of -en dev- issues');

done_testing;
