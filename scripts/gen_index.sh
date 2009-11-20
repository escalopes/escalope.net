#!/usr/bin/env bash

cat head.html
echo '<p><a href="http://github.com/sunny/escalope.net"><img style="position: absolute; top: 0; right: 0; border: 0; z-index: 50" src="http://s3.amazonaws.com/github/ribbons/forkme_right_white_ffffff.png" alt="Fork me on GitHub" /></a></p>'
echo '<div id="twitter">'
cat includes/twitter.html
echo '</div>'
echo '<div id="itquotes">'
echo "<pre>"
sh scripts/itquote.sh
echo "</pre>"
echo '</div>'
echo '<div style="clear:both;">&nbsp;</div>'
cat foot.html
