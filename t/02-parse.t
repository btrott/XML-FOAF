# $Id: 02-parse.t,v 1.2 2003/01/27 23:53:02 btrott Exp $

use strict;

use Test;
use XML::FOAF;
use File::Basename qw( dirname );
use File::Spec;

my $dir = File::Spec->catfile(dirname($0), 'samples');
opendir my $dh, $dir or die "Error opening $dir: $!";
my @tests;
for my $test_file (readdir $dh) {
    push @tests, File::Spec->catfile($dir, $test_file)
        if $test_file =~ /\.foaf$/;
}
closedir $dh;

plan tests => scalar @tests;

for my $test_file (@tests) {
    my $foaf;
    ok(XML::FOAF->new($test_file, 'http://foo.com'));
}
