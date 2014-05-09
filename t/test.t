#!/usr/bin/perl

use JSON;
my $filename = './t/fixtures/issues.mock.json';

my $json_text = do {
   open(my $json_fh, "<:encoding(UTF-8)", $filename)
      or die("Can't open \$filename\": $!\n");
   local $/;
   <$json_fh>
};

my $json = JSON->new;
my $issues = $json->decode($json_text);

my @ids;
for ( @{$issues->{issues}} ) {
	push @ids, $_->{id};
}
warn $#ids;
