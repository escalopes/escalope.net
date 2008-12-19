#!/usr/bin/env bash

QUOTES='http://edit.sunfox.org/itquotes/txt'

cat head.html
echo "<pre>"
ruby -e "require 'open-uri';l = open('$QUOTES').readlines;puts l[rand(l.length)]" | cowsay
echo "</pre>"
cat foot.html
