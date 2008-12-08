require 'yaml'
require 'open-uri'

# Monkey-hash so that h.foo actually does h["foo"]
class Hash
  def method_missing(s) self[s.to_s] end
end

# Get users
users = YAML.load(open('http://edit.sunfox.org/escalope.yml.txt'))
users.each do |id, user|
  users[id] ||= {}
  users[id]['image'] ||= File.exists?("images/tronches/#{id}.jpg") ? \
    "/images/tronches/#{id}.jpg" : "/scripts/google-image.php?q=#{id}&amp;cache=0"        #' style='opacity:.3'"
  users[id]['nick'] ||= id
end
users = users.sort_by { |id, user| user.nick.downcase }

# Print HTML
puts open('head.html').read.gsub(/<title>.*<\/title>/, '<title>Tronchi</title>')
puts "<div id='tronchi'><ul>"
users.each do |id, user|
  nick = user.uri ? "<a class='url' href='#{user.uri}'>#{user.nick}</a>" : user.nick
  puts "<li class='vcard' id='#{id}'>"
  puts "  <p class='nick'>#{nick}</p>"
  puts "  <p><img width='160' class='photo' height='160' src='#{user.image}' alt='Photo de #{user.nick}' /></p>"
  puts user.name ? "  <p><span class='fn'>#{user.name}</span></p>" : "  <p>&nbsp;</p>"
  puts user.locality ? "  <p class='adr'><span class='locality'>#{user.locality}</span>, <span class='country-name'>#{user.country}</span></p>" : ""
  puts "</li>"
end
puts "</ul></div>"
puts open('foot.html').read

