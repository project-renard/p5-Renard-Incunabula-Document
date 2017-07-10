use Renard::Incunabula::Common::Setup;
package Renard::Incunabula::Page::RenderedFromPNG;
# ABSTRACT: Page generated from PNG data

use Moo;

with qw(
	Renard::Incunabula::Page::Role::CairoRenderableFromPNG
	Renard::Incunabula::Page::Role::BoundsFromCairoImageSurface
);

1;
