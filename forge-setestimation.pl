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

say "estim_value:" . $client->issues->issue->get(14534)->{'issue'}->{'estimated_hours'};
#$client->issues->issue->get(14534)->{'issue'}->{'estimated_hours'};

