package iTunes::Today;

use uni::perl ':dumper';
use Encode;
use URI;

use Mojo::UserAgent;

sub new {
    my ( $class, $conf ) = @_;
    bless {
        ua_obj   => Mojo::UserAgent->new,
        ua_list  => $conf->{user_agent} || [],
        base_url => $conf->{base_url},
    }, $class;
}

sub parse {
    my ( $self, %p ) = @_;

    my $url = URI->new( $self->{base_url} );
    $url->query_form( \%p );

    say $url->as_string;

    my $ua        = $self->{ua_list};
    my $ua_string = $ua->[ rand(@$ua) ];

    my $res_json = $self->{ua_obj}->get( $url->as_string, { 'User-Agent' => $ua_string } )->result->json;

    return {
        params    => \%p,
        url       => $url->as_string,
        ua_string => $ua_string,
        res_json  => $res_json,
    };
}

1;
