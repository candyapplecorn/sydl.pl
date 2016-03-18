#!/usr/bin/perl
use Switch;
use WWW::Mechanize;
use warnings;
# ============================
# This script takes a youtube
# URL and converts it into an
# aac audio file using ffmpeg
# and youtube-dl. 
# The system must have ffmpeg,
# WWW::Mechanize and
# youtube-dl installed, as
# well as an aac encoder for
# ffmpeg. Simply change the
# audio format to avoid
# installing the aac encoder
# ============================
# by candyapplecorn
# ============================

# declare a WWW::Mechanize object named $mech
my $mech = WWW::Mechanize->new( autocheck => 1 );

# tell mech to get all html from a link or die
die "Usage: \$ perl script URL\n" unless ( $ARGV[0] );
$mech->get( $ARGV[0] );

# extract the title from the mech's content
my @eowtitle = grep{ /.*/ }$mech->content ;
my $string;
foreach( split ("\n", $eowtitle[$#eowtitle]) ){
    $string = $_ if $_ =~ /eow-title/;
    last if $_ =~ /eow-title/;
}
$string =~ /title="(.*?)">/;

# create a system call
my $systemCall = 'youtube-dl -o "'.$1.'.aac" --prefer-ffmpeg --audio-format aac -x '.$ARGV[0].' &';

# If the user wants to use the opus format, which is the default format selected
# by youtube-dl, simply append the "s" option.
if (@ARGV > 1) {
    switch ($ARGV[1]) {
        case "s"    { $systemCall = 'youtube-dl --prefer-ffmpeg -x '.$ARGV[0].' &' }
        else        { die $ARGV[1] . " is an invalid option.\n"; }
    }   
}

# pipe the system call's output to FH
open(FH, "-|", $systemCall);

# print the output to the screen
while(<FH>){ print $_ }
