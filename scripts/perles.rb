#!/usr/bin/env ruby
require 'rubygems'
require 'htmlentities'
require 'open-uri'

colors = ['aliceblue', 'antiquewhite', 'aqua', 'aquamarine', 'azure', 'beige', 'bisque', 'black', 'blanchedalmond', 'blue', 'blueviolet', 'brown', 'burlywood', 'cadetblue', 'chartreuse', 'chocolate', 'coral', 'cornflowerblue', 'cornsilk', 'crimson', 'cyan', 'darkblue', 'darkcyan', 'darkgoldenrod', 'darkgray', 'darkgreen', 'darkkhaki', 'darkmagenta', 'darkolivegreen', 'darkorange', 'darkorchid', 'darkred', 'darksalmon', 'darkseagreen', 'darkslateblue', 'darkslategray', 'darkturquoise', 'darkviolet', 'deeppink', 'deepskyblue', 'dimgray', 'dodgerblue', 'firebrick', 'floralwhite', 'forestgreen', 'fuchsia', 'gainsboro', 'ghostwhite', 'gold', 'goldenrod', 'gray', 'green', 'greenyellow', 'honeydew', 'hotpink', 'indianred', 'indigo', 'ivory', 'khaki', 'lavender', 'lavenderblush', 'lawngreen', 'lemonchiffon', 'lightblue', 'lightcoral', 'lightcyan', 'lightgoldenrodyellow', 'lightgreen', 'lightgrey', 'lightpink', 'lightsalmon', 'lightseagreen', 'lightskyblue', 'lightslategray', 'lightsteelblue', 'lightyellow', 'lime', 'limegreen', 'linen', 'magenta', 'maroon', 'mediumaquamarine', 'mediumblue', 'mediumorchid', 'mediumpurple', 'mediumseagreen', 'mediumslateblue', 'mediumspringgreen', 'mediumturquoise', 'mediumvioletred', 'midnightblue', 'mintcream', 'mistyrose', 'moccasin', 'navajowhite', 'navy', 'oldlace', 'olive', 'olivedrab', 'orange', 'orangered', 'orchid', 'palegoldenrod', 'palegreen', 'paleturquoise', 'palevioletred', 'papayawhip', 'peachpuff', 'peru', 'pink', 'plum', 'powderblue', 'purple', 'red', 'rosybrown', 'royalblue', 'saddlebrown', 'salmon', 'sandybrown', 'seagreen', 'seashell', 'sienna', 'silver', 'skyblue', 'slateblue', 'slategray', 'snow', 'springgreen', 'steelblue', 'tan', 'teal', 'thistle', 'tomato', 'turquoise', 'violet', 'wheat', 'white', 'whitesmoke', 'yellow', 'yellowgreen']
colors = colors.sort_by { rand }

startquote = "<blockquote>\n<ul>"
endquote = "</ul>\n</blockquote>"

puts File.open('head.html').read
puts "<div id='perles' class='hfeed'>"
puts startquote

quotes = open('http://edit.sunfox.org/perles.txt')
nicks_with_color = {}
nickre = /^\&#60;(.*?)&#62;/
quotes.each_line do |line|
  line = line.rstrip
  if line == ""
    puts endquote
    puts startquote
    next
  end
  line = HTMLEntities.encode_entities(line, :decimal)
  if line =~ nickre
    nicks_with_color[$1.to_s] = colors.pop unless nicks_with_color.has_key?($1.to_s)
    line = "&lt;<span style='color:#{nicks_with_color[$1]}'>#{$1}</span>&gt;#{line.gsub(nickre, '')}"
  end
  line = line.gsub(/  /,'&nbsp;'*2).gsub("\t", '&nbsp;'*4) # keep spacing
  puts "<li>#{line}</li>"
end

puts endquote
puts "</div>"
puts File.open('foot.html').read
