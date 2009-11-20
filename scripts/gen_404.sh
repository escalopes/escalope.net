#!/bin/sh
cat head.html | sed 's#<title>.*</title>#<title>404 Not Found</title>#i' | sed 's#<body>#<body id="page404">#i'
echo "<h2>OMG, A 404 !!1</h2>"
echo "<p><img src='/images/404omg.png' alt='OMG !!1' /></p>"
echo "<p><a href='/'>Retournez donc &agrave; l'accueil</a>, c'est mieux pour vous&nbsp;!</a></p>"
cat foot.html
