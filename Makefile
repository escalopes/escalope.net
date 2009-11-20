all: css index perles tronchi 404

tronchi:
	ruby scripts/gen_tronchi.rb > tronchi.html
css:
	python scripts/cssgen.py stylesheets/*.clevercss > stylesheets/escalope.css
perles:
	ruby scripts/perles.rb > perles.html
404:
	sh scripts/gen_404.sh > 404.html
index:
	sh scripts/gen_index.sh > index.html

clean:
	rm -f scripts/*.pyc

distclean: clean
	rm -f index.html perles.html 404.html tronchi.html crowd.xml
	rm -f perles.shtml tronchi.shtml
	rm -f stylesheets/escalope.css

