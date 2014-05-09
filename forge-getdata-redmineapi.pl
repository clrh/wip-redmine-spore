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

#say dump $client->issues->issue->get(11542);
#say $client->issues->list->all(query_id => '495')->{total_count};
#say dump $client->issues->get(query_id => '559');
#4edd0a8139814c911fb13570d1201b0489ab16d1
#say dump $client->queries->list->all;

my $issues = $client->issues->list->all(query_id => '561',project_id=>'56');

foreach my $issue (@$issues) {
    say $issue->{id};
}
