
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Module for creating Perl SADI services',
  'AUTHOR' => 'Ben Vandervalk (ben [dot] vvalk [at] gmail [dot] com), Edward Kawas, Martin Senger',
  'BUILD_REQUIRES' => {
    'File::Slurp' => '0',
    'IO::String' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'SADI-Simple',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'SADI::Simple',
  'PREREQ_PM' => {
    'HTTP::Date' => '0',
    'Log::Log4perl' => '0',
    'RDF::Trine' => '0.135',
    'Template' => '0',
    'URI' => '0'
  },
  'VERSION' => '0.005',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



