use Renard::Incunabula::Common::Setup;
package Renard::Incunabula::Page::Role::BoundsFromCairoImageSurface;
# ABSTRACT: A role to build the bounds from the size of a Cairo::ImageSurface

use Moo::Role;
use Renard::Incunabula::Common::Types qw(PositiveOrZeroInt);

with qw(Renard::Incunabula::Page::Role::Bounds);

=attr width

A L<PositiveOrZeroInt> that is the width of the C</cairo_image_surface>.

=attr height

A L<PositiveOrZeroInt> that is the height of the C</cairo_image_surface>.

=cut
has [ qw(width height) ] => (
	is => 'lazy', # _build_width _build_height
	isa => PositiveOrZeroInt,
);

method _build_width() :ReturnType(PositiveOrZeroInt) {
	$self->cairo_image_surface->get_width;
}

method _build_height() :ReturnType(PositiveOrZeroInt) {
	$self->cairo_image_surface->get_height;
}

1;
