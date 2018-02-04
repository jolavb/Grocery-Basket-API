# frozen_string_literal: true

require 'unirest'
require 'json'


# After importing new sale data:
# 1. Run Generate_Ingredient_json to populate json file
# 2. Run Load clean_ingredients to add standardized ingredient names to items
# 3. Run generate_recieipes to populate recipes table with recipes based on StandardTitle of ingredients_list

# Generates json file with cleaned ingredient list by feeding unique ingredients to api

cat_params = []
Item.select(:title).map(&:title).uniq.each do |item|
  cat_params.push(title: item, upc: '', plu_code: '')
end

json_cat = JSON.generate(cat_params)


#
# response = Unirest.post "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/food/products/classifyBatch",
#   headers:{
#     "X-Mashape-Key" => ENV['X_Mashape_Key'],
#     "Content-Type" => "application/json",
#     "Accept" => "application/json"
#   },
#   parameters: json_cat

response = Unirest.post 'https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/food/products/classifyBatch',
  headers:{
    "X-Mashape-Key" => ENV['X_Mashape_Key'],
    "Content-Type" => "application/json",
    "Accept" => "application/json"
  },
  parameters: json_cat



File.open('lib/seeds/catagorized_items.json', 'w') do |f|
  f.write(response.body.to_json)
end

puts response.body
