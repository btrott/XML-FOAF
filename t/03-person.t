# $Id: 03-person.t,v 1.2 2003/01/27 23:53:02 btrott Exp $

use strict;

use Test;
use XML::FOAF;
use File::Basename qw( dirname );
use File::Spec;

BEGIN { plan tests => 13 }

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
