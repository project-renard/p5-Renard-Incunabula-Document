use Renard::Incunabula::Common::Setup;
package Renard::Incunabula::Devel::TestHelper;
# ABSTRACT: A test helper with functions useful for various Renard distributions

use Renard::Incunabula::Common::Types qw(CodeRef InstanceOf Maybe PositiveInt DocumentModel Dir Tuple);

=func test_data_directory

  Renard::Incunabula::Devel::TestHelper->test_data_directory

Returns a L<Path::Class> object that points to the path defined by
the environment variable C<RENARD_TEST_DATA_PATH>.

If the environment variable is not defined, throws an error.

=cut
classmethod test_data_directory() :ReturnType(Dir) {
	require Path::Tiny;
	Path::Tiny->import();

	if( not defined $ENV{RENARD_TEST_DATA_PATH} ) {
		die "Must set environment variable RENARD_TEST_DATA_PATH to the path for the test-data repository";
	}
	return path( $ENV{RENARD_TEST_DATA_PATH} );
}

=func create_cairo_document

  Renard::Incunabula::Devel::TestHelper->create_cairo_document

Returns a L<Renard::Incunabula::Format::Cairo::ImageSurface::Document> which can be
used for testing.

The pages have the colors:

=for :list

* red

* green

* blue

* black

=cut
classmethod create_cairo_document( :$repeat = 1, :$width = 5000, :$height = 5000 ) {
	require Renard::Incunabula::Format::Cairo::ImageSurface::Document;
	require Cairo;

	my $colors = [
		(
			[ 1, 0, 0 ],
			[ 0, 1, 0 ],
			[ 0, 0, 1 ],
			[ 0, 0, 0 ],
		) x ( $repeat )
	];

	my @surfaces = map {
		my $surface = Cairo::ImageSurface->create(
			'rgb24', $width, $height
		);
		my $cr = Cairo::Context->create( $surface );

		my $rgb = $_;
		$cr->set_source_rgb( @$rgb );
		$cr->rectangle(0, 0, $width, $height);
		$cr->fill;

		$surface;
	} @$colors;

	my $cairo_doc = Renard::Incunabula::Format::Cairo::ImageSurface::Document->new(
		image_surfaces => \@surfaces,
	);
}

1;
