#!/usr/bin/env ruby
require 'rubygems'
require 'htmlentities'
require 'open-uri'

PERLES_URI = 'http://edit.sunfox.org/perles/txt'

colors = ['aliceblue', 'antiquewhite', 'aqua', 'aquamarine', 'azure', 'beige', 'bisque', 'black', 'blanchedalmond', 'blue', 'blueviolet', 'brown', 'burlywood', 'cadetblue', 'chartreuse', 'chocolate', 'coral', 'cornflowerblue', 'cornsilk', 'crimson', 'cyan', 'darkblue', 'darkcyan', 'darkgoldenrod', 'darkgray', 'darkgreen', 'darkkhaki', 'darkmagenta', 'darkolivegreen', 'darkorange', 'darkorchid', 'darkred', 'darksalmon', 'darkseagreen', 'darkslateblue', 'darkslategray', 'darkturquoise', 'darkviolet', 'deeppink', 'deepskyblue', 'dimgray', 'dodgerblue', 'firebrick', 'floralwhite', 'forestgreen', 'fuchsia', 'gainsboro', 'ghostwhite', 'gold', 'goldenrod', 'gray', 'green', 'greenyellow', 'honeydew', 'hotpink', 'indianred', 'indigo', 'ivory', 'khaki', 'lavender', 'lavenderblush', 'lawngreen', 'lemonchiffon', 'lightblue', 'lightcoral', 'lightcyan', 'lightgoldenrodyellow', 'lightgreen', 'lightgrey', 'lightpink', 'lightsalmon', 'lightseagreen', 'lightskyblue', 'lightslategray', 'lightsteelblue', 'lightyellow', 'lime', 'limegreen', 'linen', 'magenta', 'maroon', 'mediumaquamarine', 'mediumblue', 'mediumorchid', 'mediumpurple', 'mediumseagreen', 'mediumslateblue', 'mediumspringgreen', 'mediumturquoise', 'mediumvioletred', 'midnightblue', 'mintcream', 'mistyrose', 'moccasin', 'navajowhite', 'navy', 'oldlace', 'olive', 'olivedrab', 'orange', 'orangered', 'orchid', 'palegoldenrod', 'palegreen', 'paleturquoise', 'palevioletred', 'papayawhip', 'peachpuff', 'peru', 'pink', 'plum', 'powderblue', 'purple', 'red', 'rosybrown', 'royalblue', 'saddlebrown', 'salmon', 'sandybrown', 'seagreen', 'seashell', 'sienna', 'silver', 'skyblue', 'slateblue', 'slategray', 'snow', 'springgreen', 'steelblue', 'tan', 'teal', 'thistle', 'tomato', 'turquoise', 'violet', 'wheat', 'white', 'whitesmoke', 'yellow', 'yellowgreen']
colors = colors.sort_by { rand }

startquote = "\n\n<blockquote>\n<ul>"
endquote = "</ul>\n</blockquote>"

quotes = open(PERLES_URI)
nicks_with_color = {}
nickre = /^\&#60;(.*?)&#62;/
html_quotes = ""
quotes.each_line do |line|
  begin
    line = line.rstrip
    if line == ""
      html_quotes << endquote
      html_quotes << startquote
      next
    end
    line = HTMLEntities.encode_entities(line, :decimal)
    if line =~ nickre
      nicks_with_color[$1.to_s] = colors.pop unless nicks_with_color.has_key?($1.to_s)
      line = "&lt;<span style='color:#{nicks_with_color[$1]}'>#{$1}</span>&gt;#{line.gsub(nickre, '')}"
    end
    line = line.gsub(/  /,'&nbsp;'*2).gsub("\t", '&nbsp;'*4) # keep spacing
    html_quotes << "<li>#{line}</li>"
  rescue
    html_quotes << "<!-- Error while generating a quote: #{$!} -->"
  end
end

html = <<-EOF
<!--#set var="page_title" value="Perles" -->
<!--#include virtual="includes/head.shtml" -->
<div id="perles" class="hfeed">
  <blockquote>
    <ul>
      #{html_quotes}
    </ul>
  </blockquote>
</div>
<!--#include virtual="includes/foot.shtml" -->
EOF

puts html