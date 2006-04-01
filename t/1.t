#!/usr/bin/perl -w

use Test::More tests => 9;

BEGIN { use_ok('DCOP::Amarok::Playlist') };
my $playlist = DCOP::Amarok::Playlist->new();
ok( defined $playlist, "new() defined the object" );
ok( $playlist->isa(DCOP::Amarok::Playlist), "   Object belongs to the class" );

SKIP: {
	skip( "Only works when amarok is installed", 6 ) if( !`amarok --version` );
	
	ok( $playlist->interfaces(),			"   interfaces returned" );
	ok( $playlist->functions(),				"   functions returned" );
	ok( $playlist->getActiveIndex(),		"   index returned" );
	ok( $playlist->getTotalTrackCount(), 	"   total tracks" );
	is( $playlist->popupMessage('Testing\ feature'), 0,  "   Popup message" );
	is( $playlist->shortStatusMessage("Amarok\\\ rocks"), 0, "   Short Status Message" );
}
