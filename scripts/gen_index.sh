#!/usr/bin/env bash

QUOTES='http://edit.sunfox.org/itquotes/txt'
COWS=(bong bunny cheese cower daemon default dragon-and-cow flaming-sheep head-in kitty meow moose mutilated satanic sheep skeleton sodomized three-eyes tux udder vader www)
random_cow=${COWS[$(expr $RANDOM % ${#COWS[@]})]}

cat head.html
echo '<p><a href="http://github.com/sunny/escalope.net"><img style="position: absolute; top: 0; right: 0; border: 0; z-index: 50" src="http://s3.amazonaws.com/github/ribbons/forkme_right_white_ffffff.png" alt="Fork me on GitHub" /></a></p>'
echo "<pre>"
ruby -e "require 'open-uri';l = open('$QUOTES').readlines;puts l[rand(l.length)]" | cowsay -f $random_cow
echo "</pre>"
cat foot.html