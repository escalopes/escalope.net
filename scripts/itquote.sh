#!/bin/sh
PATH=/bin:/usr/local/bin
QUOTES='http://edit.sunfox.org/itquotes/txt'
COWS=(bong bunny cheese cower daemon default flaming-sheep head-in kitty meow moose mutilated satanic sheep skeleton sodomized three-eyes tux udder vader www dragon-and-cow)
random_cow=${COWS[$(expr $RANDOM % ${#COWS[@]})]}
/usr/bin/ruby -e "require 'open-uri';l = open('$QUOTES').readlines;puts l[rand(l.length)]" | cowsay -f $random_cow