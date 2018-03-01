package TodayFeed;
use Mojo::Base 'Mojolicious';
use Mojo::mysql;

# This method will run once at server start
sub startup {
  my $self = shift;

  # Load configuration from hash returned by "my_app.conf"
  my $config = $self->plugin('Config');

  # Mysql helper
  $self->helper( mysql => sub{ state    $mysql = Mojo::mysql->strict_mode('mysql://'. $config->{db}{user} .':'. $config->{db}{pass}
    .'@'. $config->{db}{host} .'/'. $config->{db}{name}) 
  } );

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
  $r->get('/today')->to('today#feed');
}

1;
