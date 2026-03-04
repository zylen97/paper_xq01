#!/usr/bin/perl
# fix-diff-citations.pl — Post-process latexdiff output
# 1. Remove \mbox{} wrappers around citations (prevents line breaks)
# 2. Extract citations from \DIFdel{} so \sout doesn't block line breaks
#    Citations get {\color{delcolor}...} instead (red but no strikethrough)
use strict;
use warnings;

my $file = $ARGV[0] or die "Usage: $0 <file.tex>\n";
open my $fh, '<', $file or die "Cannot read $file: $!\n";
my $content = do { local $/; <$fh> };
close $fh;

# Step 1: Remove \mbox{%DIFAUXCMD ... \citep{...} }\hskip0pt%DIFAUXCMD wrappers
$content =~ s/\\mbox\{%DIFAUXCMD\s*\n(\\cite[pt]?\{[^}]+\})\s*\}\\hskip0pt%DIFAUXCMD/$1/g;

# Step 2: Extract citations from \DIFdel{...} blocks
# Match \DIFdel{...} allowing up to 2 levels of nested braces
$content =~ s#\\DIFdel\{((?:[^{}]|\{(?:[^{}]|\{[^{}]*\})*\})*)\}#
    my $inner = $1;
    $inner =~ s!(\\cite[pt]?\{[^{}]+\})!}{\\color{delcolor}$1}\\DIFdel{!g;
    "\\DIFdel{" . $inner . "}"
#ge;

# Step 3: Clean up empty \DIFdel{} left over
$content =~ s/\\DIFdel\{\s*\}//g;

open my $out, '>', $file or die "Cannot write $file: $!\n";
print $out $content;
close $out;
