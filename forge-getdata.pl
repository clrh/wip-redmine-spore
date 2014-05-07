#!/usr/bin/perl

use Modern::Perl;
use Net::HTTP::Spore;
use Data::Dumper;
use Config::YAML;


my $conf = Config::YAML->new( config => "myforge.yaml");
my $client = Net::HTTP::Spore->new_from_spec(
	'redmine.json',
	trace => "1=log.txt",
	base_url => $conf->get_base_url
);

$client->enable(
	'Auth::Basic',
	username => $conf->get_user,
	password => $conf->get_pass
);
$client->enable('Format::JSON');

my $issue =  $client->get_issue(1042,'json');
say Data::Dumper::Dumper $issue;
