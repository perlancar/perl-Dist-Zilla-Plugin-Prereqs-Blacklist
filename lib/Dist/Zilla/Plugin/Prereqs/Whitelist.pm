package Dist::Zilla::Plugin::Prereqs::Whitelist;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Moose;
use namespace::autoclean;

with (
    'Dist::Zilla::Role::AfterBuild',
);

has module => (is=>'rw');

sub mvp_multivalue_args { qw(module) }

sub after_build {}

__PACKAGE__->meta->make_immutable;
1;
# ABSTRACT: Whitelist prereqs

=for Pod::Coverage .+

=head1 SYNOPSIS

In your F<dist.ini>:

 [Prereqs::Blacklist]
 author=PERLANCAR
 author=SHARYANTO
 module=Log::Any
 module=List::MoreUtils
 module_regex=\ALog::Log4perl(\z|::)

 [Prereqs::Whitelist]
 module=Date::Extract::PERLANCAR
 module_regex=\ALog::ger(\z|::)

The above means to blacklist any prereq that is written by PERLANCAR or
SHARYANTO, modules C<Log::Any> and C<List::MoreUtils>, as well as modules that
matches /\ALog::Log4perl(\z|::)/. However, modules C<Date::Extract::PERLANCAR>
as well as those matching /\ALog::ger(\z|::)/ are allowed (even though they are
written by PERLANCAR).


=head1 SEE ALSO

L<Dist::Zilla::Plugin::Prereqs::Blacklist>
