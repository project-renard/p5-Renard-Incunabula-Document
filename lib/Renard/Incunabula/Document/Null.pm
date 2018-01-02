use Renard::Incunabula::Common::Setup;
package Renard::Incunabula::Document::Null;
# ABSTRACT: A null document

use Moo;
use Renard::Incunabula::Common::Types qw(ArrayRef InstanceOf);

=attr pages

An C<ArrayRef[InstanceOf['Renard::Incunabula::Page::Null']]> of pages.

This attribute is required.

=cut
has pages => (
	is => 'ro',
	isa => ArrayRef[InstanceOf['Renard::Incunabula::Page::Null']],
	required => 1,
);

method _build_last_page_number() {
	0 + @{ $self->pages };
}

extends qw(Renard::Incunabula::Document);

with qw(Renard::Incunabula::Document::Role::Pageable);

1;
