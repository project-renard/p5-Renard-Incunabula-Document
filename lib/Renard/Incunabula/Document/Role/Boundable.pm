use Renard::Incunabula::Common::Setup;
package Renard::Incunabula::Document::Role::Boundable;
# ABSTRACT: Role for documents where each page has bounds

use Moo::Role;
use Renard::Incunabula::Common::Types qw(ArrayRef HashRef);

=attr identity_bounds

An C<ArrayRef[HashRef]> of data that gives information about the bounds of each page of
the document.

=cut
has identity_bounds => (
	is => 'lazy', # _build_identity_bounds
	isa => ArrayRef[HashRef],
);

1;
