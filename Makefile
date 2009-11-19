all: css perles tronchi

#crowd: escalope.n3 scripts/sparql.py scripts/sparql_to_hcard.xsl
#	python scripts/sparql.py > crowd.xml
#tronchi: crowd 
#	sh scripts/gen_tronchi.sh > tronchi.html

tronchi:
	ruby scripts/gen_tronchi.rb > tronchi.shtml
css:
	python scripts/cssgen.py stylesheets/*.clevercss > stylesheets/escalope.css
perles:
	ruby scripts/perles.rb > perles.shtml

clean:
	rm -f scripts/*.pyc
	rm crowd.xml

distclean: clean
	rm -f index.html
	rm -f perles.html
	rm -f 404.html
	rm -f tronchi.html
	rm -f stylesheets/escalope.css

