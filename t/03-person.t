# $Id: 03-person.t 1758 2005-01-01 01:28:15Z btrott $

use strict;

use Test;
use XML::FOAF;
use File::Basename qw( dirname );
use File::Spec;

BEGIN { plan tests => 16 }

my $test_file = File::Spec->catfile(dirname($0), 'samples', 'person.foaf');
die "$test_file does not exist" unless -e $test_file;
my $foaf = XML::FOAF->new($test_file, 'http://foo.com');
ok($foaf);
ok(my $person = $foaf->person);
ok($person->name, 'Benjamin Trott');
ok($person->firstName, 'Benjamin');
ok($person->surname, 'Trott');
ok($person->nick, 'Ben');
ok($person->mbox, 'mailto:ben@stupidfool.org');
ok($person->homepage, 'http://www.stupidfool.org/');
ok($person->workplaceHomepage, 'http://www.sixapart.com/');
ok(my $friends = $person->knows);
ok(@$friends, 1);
ok($friends->[0]->name, 'Mena Trott');
ok($friends->[0]->mbox, 'mailto:mena@dollarshort.org');

$test_file = File::Spec->catfile(dirname($0), 'samples', 'person-lower-case.foaf');
die "$test_file does not exist" unless -e $test_file;
$foaf = XML::FOAF->new($test_file, 'http://foo.com');
ok($foaf);
ok($person = $foaf->person);
ok($person->name, 'Benjamin Trott');
