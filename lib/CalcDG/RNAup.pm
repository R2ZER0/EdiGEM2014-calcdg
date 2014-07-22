package CalcDG::RNAup;

use IPC::Open3 qw( open3 );

use Moo;
use namespace::clean;

has '_in' => ( is => 'rw' );
has '_out' => ( is => 'rw' );
has '_pid' => ( is => 'rw' );

sub BUILD {
    my $self = shift;
    
    my ($in, $out);
    my $pid = open3($in, $out, $out, "RNAup -o -d 2 --noLP --include_both -c S");
    
    $self->_in($in);
    $self->_out($out);
    $self->_pid($pid);
}

sub done {
    my $self = shift;
    
    # RNAup quits upon sending the @ symbol
    print $self->_in "@\n";
    waitpid($self->_pid);
    
    $self->_din(undef);
    $self->_dout(undef);
    $self->_pid(undef);
}

1;