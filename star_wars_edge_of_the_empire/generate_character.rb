#

require 'erb'
require 'yaml'

if ARGV[0].nil? || ARGV[0].empty?
  raise "Supply the YAML character data file."
end

character_data_file = ARGV[0]

character_vars = YAML.safe_load(File.read(character_data_file))

template = ERB.new(File.read('character_templates/ffg_star_wars_edge_of_the_empire_character_sheet.html.erb'), nil, "%")
#template.run

File.open("character_sheets/#{character_vars['character_name']}_star_wars_eote_character_sheet.html", 'w') do |file|
  file.write(template.result(binding))
end

puts "=> Generated character_sheets/#{character_vars['character_name']}_star_wars_eote_character_sheet.html"
