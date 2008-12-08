#!/usr/bin/env bash
cat head.html
echo "<pre>"
ruby -e "require 'open-uri'; l = open('http://edit.sunfox.org/itquotes.txt').readlines; puts l[rand(l.length)]" | cowsay
echo "</pre>"
cat foot.html
