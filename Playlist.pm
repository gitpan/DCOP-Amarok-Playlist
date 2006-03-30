package DCOP::Amarok::Playlist;

use 5.008001;
use strict;
use warnings;

require DCOP::Amarok;

our @ISA = qw(DCOP::Amarok);

our $VERSION = '0.003';

=head1 NAME

DCOP::Amarok::Playlist - Perl extension to speak to an amaroK player object via system's DCOP.

=head1 SYNOPSIS

	use DCOP::Amarok::Playlist;
	$playlist = DCOP::Amarok::Playlist->new();

	$playlist->togglePlaylist();
	print $playlist->getActiveIndex();

=head1 DESCRIPTION

This module is a quick hack to get an interface between perl and Kde's DCOP,
since Kde3.4's perl bindings are disabled. This suite talks to 'dcop'.
DCOP::Amarok::Playlist talks directly to the playlist object of amaroK.

=head1 EXPORT

None by default.

=head1 METHODS

=item new()

Constructor. No arguments needed. If the program will be run remotely, the
need for 'user => "myusername"' arises.

=cut

sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;
	my %params = @_;
	my $self  = $class->SUPER::new(%params, control => "playlist" );
	bless ($self, $class);
	return $self;
}

=item interfaces()

	Returns a list of the interfaces.

=cut

sub interfaces() {
	my $self = shift;
	chomp( my @list = `$self->{dcop} interfaces` );
	return @list;
}

=item functions()

	Returns a list of the functions.

=cut

sub functions() {
	my $self = shift;
	chomp( my @list = `$self->{dcop} functions` );
	return @list;
}

=item getActiveIndex()

	Returns the number of the active index.

=cut

sub getActiveIndex() {
	my $self = shift;
	chomp( $_ = `$self->{dcop} getActiveIndex` );
	return $_;
}

=item getTotalTrackCount()

	Returns the total number of tracks in the playlist.

=cut

sub getTotalTrackCount() {
	my $self = shift;
	chomp( $_ = `$self->{dcop} getTotalTrackCount` );
	return $_;
}

=item saveCurrentPlaylist()

	Makes the object save the present list.
	Returns the path.

=cut

sub saveCurrentPlaylist() {
	my $self = shift;
	chomp( $_ = `$self->{dcop} saveCurrentPlaylist` );
	return $_;
}

=item addMedia($URL)

	Adds new media.

=cut

sub addMedia() {
	my $self = shift;
	while(@_){
		system( "$self->{dcop}", 'addMedia', "$_");
	}
}


#sputnik@zeus:~$ dcop amarok playlist
#QCStringList interfaces()
#	QCStringList functions()
#	int getActiveIndex()
#	int getTotalTrackCount()
#	QString saveCurrentPlaylist()
#	void addMedia(KURL)
#	void addMediaList(KURL::List)
#	void clearPlaylist()
#	void playByIndex(int)
#	void playMedia(KURL)
#	void popupMessage(QString)
#	void removeCurrentTrack()
#	void repopulate()
#	void saveM3u(QString path,bool relativePaths)
#	void setStopAfterCurrent(bool)
#	void shortStatusMessage(QString)
#	void shufflePlaylist()
#	void togglePlaylist()

=item addMediaList()

	Adds new media.

=cut

sub addMediaList() {
	my $self = shift;
	system( "$self->{dcop}", 'addMediaList', "@_");
}

=item clearPlaylist()


=cut

sub clearPlaylist() {
	my $self = shift;
	system( "$self->{dcop}", 'clearPlaylist' );
}

=item playByIndex(int)

	Plays by index

=cut

sub playByIndex() {
	my $self = shift;
	system( "$self->{dcop}", 'playByIndex' );
}

=item playMedia()


=cut

sub playMedia() {
	my $self = shift;
	my $url = shift;
	system( "$self->{dcop}", "playMedia", "$url" );
}

=item popupMessage()


=cut

sub popupMessage() {
	my $self = shift;
	my $msg = shift;
	system( "$self->{dcop}", "popupMessage", "$msg" );
}

sub removeCurrentTrack() {
	my $self = shift;
	system( "$self->{dcop}", "removeCurrentTrack" );
}

sub repopulate() {
	my $self = shift;
	system( "$self->{dcop}", "repopulate" );
}

sub saveM3uRelative() {
	my $self = shift;
	my $path = shift;
	system( "$self->{dcop}", "saveM3u", "$path", "1" );
}

sub saveM3uAbsolut() {
	my $self = shift;
	my $path = shift;
	system( "$self->{dcop}", "saveM3u", "$path", "0" );
}

sub setStopAfterCurrent() {
	my $self = shift;
	system( "$self->{dcop}", "setStopAfterCurrent", "1" );
}

sub notStopAfterCurrent() {
	my $self = shift;
	system( "$self->{dcop}", "setStopAfterCurrent", "0" );
}

sub shortStatusMessage() {
	my $self = shift;
	my $msg = shift;
	system( "$self->{dcop}", "shortStatusMessage", "$msg" );
}

sub shufflePlaylist() {
	my $self = shift;
	system( "$self->{dcop}", "shufflePlaylist" );
}

#	void togglePlaylist()
sub togglePlaylist() {
	my $self = shift;
	system( "$self->{dcop}", "togglePlaylist" );
}

1;
__END__

=head1 AUTHOR

Juan C. Muller, E<lt>jcmuller@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2005 by Juan C. Muller

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

