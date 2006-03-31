# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::Simple tests => 2;

use DCOP::Amarok::Playlist;

my $playlist = DCOP::Amarok::Playlist->new();

ok( defined $playlist, "new() defined the object" );

ok( $playlist->isa(DCOP::Amarok::Playlist), "   Object belongs to the class" );


#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

