package iTunes::Today;

use uni::perl ':dumper';
use Encode;

use Mojo::UserAgent;

sub new {
  my ($class, $conf) = @_;
  bless {
    ua_obj   => Mojo::UserAgent->new,
    ua_list  => $conf->{user_agent} || [],
    base_url => $conf->{base_url},
  }, $class;
}

sub parse {
  my ($self, %p) = @_;

  $p{start_date} = $p{end_date} = delete $p{date};

  my $url = $self->{base_url} . '?' . (
    join '&', (
      map { $_ . '=' . $p{$_} } keys %p
    )
  );

  my $ua = $self->{ua_list};
  my $ua_string = $ua->[rand(@$ua)];

  my $res_json = $self->{ua_obj}->get($url, {'User-Agent' => $ua_string})->result->json;

  return {
    params    => \%p,
    url       => $url,
    ua_string => $ua_string,
    res_json  => $res_json,
  };
}

1;
