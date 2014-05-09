#!/usr/bin/perl

use Modern::Perl;
use Redmine::API;
use Data::Dump qw/dump/;
use Config::YAML;

my $conf = Config::YAML->new( config => "myforge.yaml");

my $client = Redmine::API->new(
    'auth_key' => $conf->get_key
    , base_url => $conf->get_base_url
    , trace => 1);

#say $client->projects->list->all;
say dump $client->issues->issue->get(1042);
