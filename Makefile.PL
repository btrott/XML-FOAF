# $Id: Makefile.PL 1758 2005-01-01 01:28:15Z btrott $

use inc::Module::Install;

name('XML-FOAF');
abstract('Parse FOAF (Friend of a Friend) data');
author('Benjamin Trott <ben+cpan@stupidfool.org>');
version_from('lib/XML/FOAF.pm');
license('perl');
no_index(directory => 't');
sign(1);

include('ExtUtils::AutoInstall');

requires('RDF::Core');
requires('URI');

features(
    'Signature verification' => [
        -default => 0,
        recommends('Crypt::OpenPGP' => '1.03'),
    ],
);

auto_include();
auto_install();

&WriteAll;
