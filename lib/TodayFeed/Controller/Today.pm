package TodayFeed::Controller::Today;
use Mojo::Base 'Mojolicious::Controller';

use iTunes::Today;

# This action will render a template
sub feed {
  my $self = shift;

  my $feed_params;
  for my $param (qw( country start_date end_date )) {
    ( $feed_params->{$param} = uc $self->param($param) ) =~ s/\s+//g;
  }

  my $parser = iTunes::Today->new();
  my $result = $parser->parse(%$feed_params);

  # Render template "today/feed.html.ep"
  $self->render(result => $result);
}

1;
