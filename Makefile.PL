use 5.035010;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME              => 'Test::Named',
    VERSION_FROM      => 'lib/Test/Named.pm',
    BUILD_REQUIRES    => {
        "Test::More"  => 0,
    },
    ABSTRACT_FROM     => 'lib/Test/Named.pm',
    AUTHOR            => 'Alejandro Imass <alejandroimass@nonet>',
    LICENSE           => 'perl',
);
