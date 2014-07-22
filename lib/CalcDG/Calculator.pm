package CalcDG::Calculator;

use Moo;
use namespace::clean;

# Input parameters
has sequence1 => ( is => 'ro' );
has sequence2 => ( is => 'ro' );

# Output
has result => (is => 'lazy');

sub _build_result {
    my $self = shift;
    return calc_dg($self->sequence1, $self->sequence2);
};

sub calc_dg {
    my @lines = shift;
    my @sequences = ();

    foreach my $line (@lines) {
        if( $line =~ /5'\s*-?\s*[ACUG]+\s*-?\s*3'/ ) {
            my $seq = $1;
            push @sequences, {
                sequence => $seq,
                dg => 123
            };
        }
    }
    return (sort { $a->{value} cmp $b->{value} } @sequences);
};

1;