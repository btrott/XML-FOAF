# $Id: 00-compile.t 956 2003-01-27 22:00:20Z btrott $

my $loaded;
BEGIN { print "1..1\n" }
use XML::FOAF;
$loaded++;
print "ok 1\n";
END { print "not ok 1\n" unless $loaded }
