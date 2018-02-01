# frozen_string_literal: true

require 'unirest'
require 'json'


# Generates json file with cleaned ingredient list by feeding all ingredients to api

cat_params = []
Item.all.each do |item|
  cat_params.push(title: item.title, upc: '', plu_code: '')
end

json_cat = JSON.generate(cat_params)

response = Unirest.post "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/food/products/classifyBatch",
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
