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

#$client->enable(
#	'Auth::Basic',
#	username => $conf->get_user,
#	password => $conf->get_pass
#);
#warn "user:".$conf->get_user.";pass:".$conf->get_pass.";url:".$conf->get_base_url;
$client->enable('Format::JSON');

my $issue =  $client->get_issue(1042,'json');
say Data::Dumper::Dumper $issue;

#say 'coucou';
#my $response = $client->get_issue(id => '12808',format => 'json');
#my $issues = $response->{issue};
#say Data::Dumper::Dumper($response);
#
#foreach my $issue (@$issues) {
#  say $issue->{id};
#}
