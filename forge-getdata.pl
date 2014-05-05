#!/usr/bin/perl

use Modern::Perl;
use Net::HTTP::Spore;
use Data::Dumper;
use Config::YAML;

my $conf = Config::YAML->new( config => "myforge.yaml");

my $client = Net::HTTP::Spore->new_from_spec('redmine.json',base_url => $conf->get_base_url);
$client->enable('Format::JSON');

say $client->get_issue(42,'json');

