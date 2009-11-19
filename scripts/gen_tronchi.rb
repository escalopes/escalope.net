require 'yaml'
require 'open-uri'

USERS_YML = 'http://edit.sunfox.org/escalope.yml/txt'

# Monkey-hash so that h.foo actually does h["foo"]
class Hash
  def method_missing(s) self[s.to_s] end
end

# Get users
users = YAML.load(open(USERS_YML))
users.each do |id, user|
  users[id] ||= {}
  users[id]['nick'] ||= id

  Thread.new(id) {
    `#{File.dirname(__FILE__)}/lucky-image '#{id}' > 'images/tronches/lucky/#{id}'`
  }

  #users[id]['image'] ||= File.exists?("images/tronches/#{id}.jpg") ? \
  #  "/images/tronches/#{id}.jpg" : "/scripts/google-image.php?q=#{id}&amp;cache=0"
  users[id]['image'] = "/images/tronches/lucky/#{id}"
  users[id]['nick'] ||= id
end
users = users.sort_by { |id, user| user.nick.downcase }

# Print HTML
tronchi_html = ""
users.each do |id, user|
  nick = user.uri ? "<a class='url' href='#{user.uri}'>#{user.nick}</a>" : user.nick
  tronchi_html << "<li class='vcard' id='#{id}'>"
  tronchi_html << "  <p class='nick'>#{nick}</p>"
  tronchi_html << "  <p><img width='160' class='photo' height='160' src='#{user.image}' alt='Photo de #{user.nick}' /></p>"
  tronchi_html << name = user.name ? "  <p><span class='fn'>#{user.name}</span></p>" : "  <p>&nbsp;</p>"
  tronchi_html << locality = user.locality ? "  <p class='adr'><span class='locality'>#{user.locality}</span>, <span class='country-name'>#{user.country}</span></p>" : ""
  tronchi_html << "</li>\n"
end

html = <<-EOF
<!--#set var="page_title" value="Tronchi" -->
<!--#include virtual="includes/head.shtml" -->
<div id='tronchi'>
  <ul>
    #{tronchi_html}
  </ul>
</div>
<!--#include virtual="includes/foot.shtml" -->
EOF

puts html