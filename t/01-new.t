# $Id: 01-new.t,v 1.3 2003/01/27 23:53:02 btrott Exp $

use strict;

use Test;
use XML::FOAF;
use File::Basename qw( dirname );
use File::Spec;
use URI;

BEGIN { plan tests => 4 }

my $dir = File::Spec->rel2abs(dirname($0));
my $test_file = File::Spec->catfile($dir, 'samples', 'bare.foaf');
die "$test_file does not exist" unless -e $test_file;
my $foaf;

ok(XML::FOAF->new(URI->new('file:/' . $test_file)));

ok(XML::FOAF->new($test_file, 'http://foo.com'));

open my $fh, $test_file or die $!;
ok(XML::FOAF->new($fh, 'http://foo.com'));

seek $fh, 0, 0;
my $data = do { local $/; <$fh> };
ok(XML::FOAF->new(\$data, 'http://foo.com'));
