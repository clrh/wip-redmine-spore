#!/usr/bin/perl

use Test::More;
use JSON;

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
  foreach $issue ( @{$issues->{issues}} ) {
  	push @ids, $issue->{id};
  }
  $#ids + 1;
}

my $filename = './t/fixtures/issues.mock.json';
my $issues = read_file_and_decode $filename;
is (count_issues($issues),25,'number of issues');

my $filename = './t/fixtures/issues-full.mock.json';
my $issues = read_file_and_decode $filename;
is (count_issues($issues),58,'number of issues');

done_testing;
