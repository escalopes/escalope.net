import clevercss
import sys

if len(sys.argv) < 2:
	print "Usage: %s clevercssfile [clevercssfile ...]" % sys.argv[0]
else:
	cssdef = ""
	for css in sys.argv[1:]:
		file = open(css)
		cssdef += file.read() + "\n"
		file.close()
	print clevercss.convert(cssdef)
