use Renard::Incunabula::Common::Setup;
package Renard::Incunabula::Document::Devel::TestHelper;
# ABSTRACT: A helper library for document tests

use Moo;

=classmethod create_null_document

  Renard::Incunabula::Document::Devel::TestHelper->create_null_document

Returns a L<Renard::Incunabula::Document::Null> which can be used for testing.

=cut
classmethod create_null_document( :$repeat = 1 ) {
	require Renard::Incunabula::Document::Null;
	require Renard::Incunabula::Page::Null;

	my $null_doc = Renard::Incunabula::Document::Null->new(
		pages => [
			map {
				Renard::Incunabula::Page::Null->new;
			} 0..$repeat*4-1
		],
	);
}


1;
