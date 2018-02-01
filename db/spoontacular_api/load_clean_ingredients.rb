require 'json'

# Run to populate item StandardTitle and usda fields
file = File.read('lib/seeds/catagorized_items.json')
data_hash = JSON.parse(file)
unique = {}

# Create unique hash from JSON to look up
data_hash.each do |item|
  unique[item['cleanTitle']] = [item['category'], item['usdaCode']]
end

# Iterate through items and update StandardTitle
Item.all.each do |item|
  search = item.title
  if unique[search]
    item.StandardTitle = unique[search][0]
    item.usda = unique[search][1]
    item.save
  end
end

# .gsub(/\s/, '_')
