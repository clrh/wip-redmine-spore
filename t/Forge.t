use strict;
use warnings;

use Test::More;
use JSON;
use Data::Dump qw/dump/;
use lib "lib";

BEGIN { use_ok('Forge') };

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

my $filename = './t/fixtures/issues.mock.json';
my $issues = read_file_and_decode $filename;
is (count_issues($issues),25,'number of issues');

$filename = './t/fixtures/issues-full.mock.json';
$issues = read_file_and_decode $filename;
is (count_issues($issues),58,'number of issues');
my %sorted_issues = count_by_status($issues);
is ($sorted_issues{7},3,'number of -en dev- issues');

done_testing;
