package iTunes::Today;

use strict;
use warnings;
use Encode;

use Mojo::UserAgent;

my $base_url = 'https://sensortower.com/api/ios/featured/today/stories';

# http://www.useragentstring.com/pages/useragentstring.php?typ=Browser

my @ua = (
  'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36',
  'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1',
  'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko',
  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A'
);

sub new { bless {
  ua => Mojo::UserAgent->new
}, shift }

sub parse {
  my $self = shift;
  my %p    = @_;

  my $url = $base_url . '?' . (
    join '&', (
      map { $_ . '=' . $p{$_} } keys %p
    )
  );

  my $ua_string = $ua[rand(@ua)];

  my $res_json = $self->{ua}->get($url, {'User-Agent' => $ua_string})->result->json;

  return {
    params    => \%p,
    url       => $url,
    ua_string => $ua_string,
    res_json  => $res_json,
  };
}

1;
