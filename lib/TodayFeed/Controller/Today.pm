package TodayFeed::Controller::Today;
use Mojo::Base 'Mojolicious::Controller';

use iTunes::Today; # TODO: remove
use uni::perl ':dumper';

use Mojo::mysql;
use POSIX qw(strftime);
use Mojo::JSON qw(from_json);

sub feed {
  my $self = shift;

  my $feed_params;
  for my $param (qw( country date )) {
    ( $feed_params->{$param} = uc $self->param($param) ) =~ s/\s+//g;
  }

  $feed_params->{date} ||= strftime("%F",localtime(time()));

  my $config = $self->app->config('db');

  my $mysql = Mojo::mysql->strict_mode('mysql://'. $config->{user} .':'. $config->{pass}
    .'@'. $config->{host} .'/'. $config->{name});

  my $result = $mysql->db->query('select * from stories where country = ? and date = ?',
    $feed_params->{country}, $feed_params->{date})->hashes->map(sub{ from_json $_->{json_source} });

  $self->render(result => $result, feed_params => $feed_params);
}

1;
