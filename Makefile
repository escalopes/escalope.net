all: css perles tronchi

tronchi:
	ruby scripts/gen_tronchi.rb > tronchi.shtml
css:
	python scripts/cssgen.py stylesheets/*.clevercss > stylesheets/escalope.css
perles:
	ruby scripts/perles.rb > perles.shtml

clean:
	rm -f scripts/*.pyc

distclean: clean
	rm -f index.html perles.html 404.html tronchi.html crowd.xml
	rm -f perles.shtml
	rm -f tronchi.shtml
	rm -f stylesheets/escalope.css

