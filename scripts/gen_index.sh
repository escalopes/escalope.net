#!/usr/bin/env bash

QUOTES='http://edit.sunfox.org/itquotes/txt'

cat head.html
echo '<p><a href="http://github.com/sunny/escalope.net"><img style="position: absolute; top: 0; right: 0; border: 0; z-index: 50" src="http://s3.amazonaws.com/github/ribbons/forkme_right_white_ffffff.png" alt="Fork me on GitHub" /></a></p>'
echo "<pre>"
ruby -e "require 'open-uri';l = open('$QUOTES').readlines;puts l[rand(l.length)]" | cowsay
echo "</pre>"
cat foot.html
