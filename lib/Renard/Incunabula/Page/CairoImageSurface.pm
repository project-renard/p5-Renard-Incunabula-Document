use Renard::Incunabula::Common::Setup;
package Renard::Incunabula::Page::CairoImageSurface;
# ABSTRACT: Page directly generated from a Cairo image surface

use Moo;
use Renard::Incunabula::Common::Types qw(InstanceOf);

=attr cairo_image_surface

The L<Cairo::ImageSurface> that this page is drawn on.

=cut
has cairo_image_surface => (
	is => 'ro',
	isa => InstanceOf['Cairo::ImageSurface'],
	required => 1
);

with qw(
	Renard::Incunabula::Page::Role::CairoRenderable
	Renard::Incunabula::Page::Role::BoundsFromCairoImageSurface
);

1;
