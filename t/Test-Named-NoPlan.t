#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

use_ok('Test::Named');

my $r = main( 'foo' );
done_testing;
diag('Should exit 0');
exit $r;

sub test_foo {
    ok(1==1,'Test Foo');
}

sub test_bar {
    ok(1==1,'Test Bar');
}

