require 'json'

file = File.read('lib/seeds/catagorized_items.json')
data_hash = JSON.parse(file)
unique = {}

# Create unique hash from JSON to look up
data_hash.each do |item|
  unique[item['cleanTitle'].gsub(/\s/, '_')] = item['category']
end

# Iterate through items and update StandardTitle
Item.all.each do |item|
  search = item.title.gsub(/\s/, '_')
  item.StandardTitle = unique[search]
  item.save
end
