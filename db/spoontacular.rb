# frozen_string_literal: true

require 'unirest'
# set item to title of item 9647 (lamb chops in this case)
item = Item.find(9647).title

response = Unirest.post "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/food/products/classify",
  headers:{
    "X-Mashape-Key" => "602U60IFrTmsh6r6HNxhewkk0lnUp1TnWOLjsnM3Uu3HqL2vdF",
    "Content-Type" => "application/json",
    "Accept" => "application/json"
  },
  parameters:  "{\"title\":\"#{item}\",\"upc\":\"\",\"plu_code\":\"\"}"

puts response.body
