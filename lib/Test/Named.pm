package Test::Named;

use 5.035010;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our $VERSION = 0.01;
our @EXPORT_OK = ( );
our @EXPORT = qw( main );

sub main {

    my @args  = @_;

    if (@args) {
        for my $name (@args) {
            die "No test method test_$name\n"
                unless my $func = caller->can( 'test_' . $name );
            $func->();
        }
        return 0;
    }

    foreach my $sub (grep(/^test_/, keys %main::)) {
        no strict 'refs';
        caller->$sub();
    }

    return 0;
}

1;
__END__

=head1 NAME

Test::Named - Perl extension for named tests. Inspired on this:

http://www.modernperlbooks.com/mt/2013/05/running-named-perl-tests-from-prove.html

=head1 SYNOPSIS

  # load your fav test harness
  use Test::More tests => 3;
  use Test::Named;

  # load module to test
  use_ok(Foo::Bar);

  # run all tests unless named test specified
  exit main( @ARGV );

  # named tests are declared using test_ prefix
  sub test_foo {
    ...
  }
  sub test_bar {

  }
  etc..

  prove -v -I lib/ t/*
  prove -v -I lib/ t/TestFile.t
  prove -v -I lib/ t/TestFile.t :: foo
  prove -v -I lib/ t/TestFile.t :: bar

=head1 DESCRIPTION

This module is a very thin wrapper that allows easy named testing
much like JUnit-based testing frameworks.

=head2 EXPORT

This module exports a subroutine named main()

=head1 SEE ALSO

https://github.com/aimass/Test-Named

=head1 AUTHOR

Alejandro Imass, https://github.com/aimass

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2022 by Alejandro Imass

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.35.10 or,
at your option, any later version of Perl 5 you may have available.


=cut
