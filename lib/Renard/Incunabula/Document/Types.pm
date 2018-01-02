use Renard::Incunabula::Common::Setup;
package Renard::Incunabula::Document::Types;
# ABSTRACT: Type library for document types

use Type::Library 0.008 -base,
	-declare => [qw(
		DocumentModel
		PageNumber
		PageCount
		LaxPageNumber
		ZoomLevel
	)];
use Type::Utils -all;

use Types::Common::Numeric qw(PositiveInt PositiveOrZeroInt PositiveNum);

=type DocumentModel

A type for any reference that extends L<Renard::Incunabula::Document>.

=cut
class_type "DocumentModel",
	{ class => "Renard::Incunabula::Document" };

=type PageNumber

An alias to L<PositiveInt> that can be used for document page number semantics.

=cut
declare "PageNumber", parent => PositiveInt;

=type PageCount

An alias to L<PositiveInt> that can be used for document page number count semantics.

=cut
declare "PageCount", parent => PositiveInt;

=type LaxPageNumber

An alias to L<PositiveOrZeroInt> that can be used for document page number
semantics when the source data may contain invalid pages.

=cut
declare "LaxPageNumber", parent => PositiveOrZeroInt;

=type ZoomLevel

The amount to zoom in on a page. This is a multiplier such that

=for :list
* when the value is C<1.0>, the page area is the standard area
* when the value is C<2.0>, the page is C<4> times the standard area
* when the value is C<0.5>, the page is C<0.25> times the standard area

=cut
declare "ZoomLevel", parent => PositiveNum;

1;
