# $Id: Makefile.PL,v 1.2 2003/01/27 23:53:15 btrott Exp $

use ExtUtils::MakeMaker;
use strict;

use ExtUtils::AutoInstall (
    -core => [
        'RDF::Core' => 0,
        'URI' => 0,
    ],

    'Signature verification' => [
        -default => 0,
        'Crypt::OpenPGP' => '1.03',
    ],
);

WriteMakefile(
    NAME => 'XML::FOAF',
    DISTNAME => 'XML-FOAF',
    VERSION_FROM => 'lib/XML/FOAF.pm',
    AUTHOR => 'Benjamin Trott <cpan@stupidfool.org>',
    ABSTRACT => 'Parse FOAF (Friend of a Friend) data',
);
