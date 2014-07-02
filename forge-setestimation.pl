#!/usr/bin/perl

use Modern::Perl;
use Redmine::API;
use Data::Dump qw/dump/;
use Data::Dumper;
use Config::YAML;

my $conf = Config::YAML->new( config => "myforge.yaml");

my $client = Redmine::API->new(
    'auth_key' => $conf->get_key
    , base_url => $conf->get_base_url
    , trace => 1);

my $file = $conf->get_numlist;
my $estim;
my $redmine_number;
my $line;
warn $file;
open(FD, $file) or say "Error: '$file' $!" and next;
while ( my $line = <FD> ) {
    my @values = split (";", $line);
    $estim = $values[0];
    $redmine_number = $values[1];
    chomp $redmine_number;
    print "rf:$redmine_number ; estim:$estim\n";
}

#my $rf = 14534; #prod
my $rf = 12789; #sbox

#say "AVT estim_value:" . $client->issues->issue->get($rf)->{'issue'}->{'estimated_hours'};
#$client->issues->issue->update($rf, estimated_hours => 8);
#say "APRES estim_value:" . $client->issues->issue->get($rf)->{'issue'}->{'estimated_hours'};

#say dump $client->issues->issue->get($rf);
#say "AVT:" . $client->issues->issue->get($rf)->{'issue'}->{'subject'};
#$client->issues->issue->update($rf, subject => "coucou tu changes!");
#say "APRES:" . $client->issues->issue->get($rf)->{'issue'}->{'subject'};

say dump $client->issues->issue->get($rf);
say "AVT:" . $client->issues->issue->get($rf)->{'issue'}->{'story_points'};
$client->issues->issue->update($rf, story_points => 20);
say "APRES:" . $client->issues->issue->get($rf)->{'issue'}->{'story_points'};
