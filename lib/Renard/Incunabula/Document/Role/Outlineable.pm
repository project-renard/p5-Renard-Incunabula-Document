use Renard::Incunabula::Common::Setup;
package Renard::Incunabula::Document::Role::Outlineable;
# ABSTRACT: Role that provides an outline for a document

use Moo::Role;
use Renard::Incunabula::Common::Types qw(InstanceOf);

=attr outline

Returns a L<Renard::Incunabula::Outline> which represents the outline for
this document.

=cut
has outline => (
	is => 'lazy', # _build_outline
	isa => InstanceOf['Renard::Incunabula::Outline'],
);

1;
