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

#say dump $client->issues->issue->get(11542);
#say $client->issues->list->all(query_id => '495')->{total_count};
#say dump $client->issues->get(query_id => '559');
#say dump $client->queries->list->all;
#say Data::Dumper::Dumper $client->issues->list->all(query_id => '496',project_id=>'56');



use JSON;
my $filename = 'issues.mock.json';

my $json_text = do {
   open(my $json_fh, "<:encoding(UTF-8)", $filename)
      or die("Can't open \$filename\": $!\n");
   local $/;
   <$json_fh>
};

my $json = JSON->new;
my $issues = $json->decode($json_text);

for ( @{$issues->{issues}} ) {
   print $_->{id}."\n";
}


