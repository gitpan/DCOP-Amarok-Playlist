use 5.008001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'DCOP::Amarok::Playlist',
    VERSION_FROM      => 'Playlist.pm', # finds $VERSION
    PREREQ_PM         => {'DCOP::Amarok' => '0.036'}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'Playlist.pm', # retrieve abstract from module
       AUTHOR         => 'Juan C. Müller <jcmuller@gmail.com>') : ()),
);
