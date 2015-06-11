package DDG::Spice::Statista;
# ABSTRACT: Returns statistics from statista.com.

use strict;
use DDG::Spice;

primary_example_queries "statistics about soccer";
description "Shows example statistics";
name "Statista";
category "facts";

my $limit = 16;
my $lang = 2;

triggers startend => "statistic", "statistics", "stats";

spice to => 'http://api.statista.com/searchJson/apiKey/{{ENV{DDG_SPICE_STATISTA_APIKEY}}}/q/$1/sort/0/lang/'.$lang.'/limit/'.$limit.'/datefrom/0/dateto/0';

spice wrap_jsonp_callback => 1;

handle remainder => sub {
    return $_ if $_;
    return;
};

1;
