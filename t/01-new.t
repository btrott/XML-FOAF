# $Id: 01-new.t,v 1.4 2003/06/24 22:35:52 btrott Exp $

use strict;

use Test;
use XML::FOAF;
use File::Basename qw( dirname );
use File::Spec;
use URI;

BEGIN { plan tests => 5 }

my $dir = File::Spec->rel2abs(dirname($0));
my $test_file = File::Spec->catfile($dir, 'samples', 'bare.foaf');
die "$test_file does not exist" unless -e $test_file;
my $foaf;

ok($foaf = XML::FOAF->new(URI->new('file:/' . $test_file)));
ok($foaf->foaf_url('file:/' . $test_file));

ok(XML::FOAF->new($test_file, 'http://foo.com'));

open my $fh, $test_file or die $!;
ok(XML::FOAF->new($fh, 'http://foo.com'));

seek $fh, 0, 0;
my $data = do { local $/; <$fh> };
ok(XML::FOAF->new(\$data, 'http://foo.com'));

## xxx need to test auto-discovery
