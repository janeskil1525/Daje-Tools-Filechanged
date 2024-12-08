package Daje::Tools::Filechanged;
use Mojo::Base -base, -signatures;

use Digest::SHA qw(sha256_hex);
use Mojo::File;

our $VERSION = "0.01";

sub is_file_changed($file_path_name, $old_hash) {
    my $result = 0;
    my $path = Mojo::File->new($file_path_name);
    my $new_hash = $self->load_new_hash($path);
    $old_hash = "" unless defined $old_hash;
    if ($new_hash ne $old_hash) {
        $result = 1;
    }
    return $result;
}

sub load_new_hash($path) {
    my $file_content = $path->slurp;
    my $hash = sha256_hex($file_content);
    return $hash;
}
1;
__END__

=encoding utf-8

=head1 NAME

Daje::Tools::Filechanged - It's new $module

=head1 SYNOPSIS

    use Daje::Tools::Filechanged;

=head1 DESCRIPTION

Daje::Tools::Filechanged is ...

=head1 LICENSE

Copyright (C) janeskil1525.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

janeskil1525 E<lt>janeskil1525@gmail.comE<gt>

=cut

