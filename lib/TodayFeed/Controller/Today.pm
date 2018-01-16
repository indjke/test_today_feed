package TodayFeed::Controller::Today;
use Mojo::Base 'Mojolicious::Controller';

use iTunes::Today;
use uni::perl ':dumper';

sub feed {
  my $self = shift;

  my $feed_params;
  for my $param (qw( country start_date end_date )) {
    ( $feed_params->{$param} = uc $self->param($param) ) =~ s/\s+//g;
  }

  my $parser = iTunes::Today->new( $self->app->config('itunes_today') );
  my $result = $parser->parse(%$feed_params);

  $self->render(result => $result);
}

1;
