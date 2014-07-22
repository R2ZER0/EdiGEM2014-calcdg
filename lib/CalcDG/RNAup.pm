package CalcDG::RNAup;

use Moo;
use namespace::clean;

has '_stdin' => ( is => 'rw' );
has '_stdout' => ( is => 'rw' );

sub BUILD {
    my $self = shift;
    
    
}

1;