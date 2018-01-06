require 'json'
require 'unirest'


def build_search_params(items)
  ingredient_list = []
  items.each do |item|
    if item.StandardTitle
      ingredient_list.push(item.StandardTitle)
    end
  end
  # %2C is ASCII code for a ','
  return ingredient_list.join('%2C')
end

def find_recipies(ingredients)
  response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=false&ingredients=#{ingredients}&limitLicense=false&number=5&ranking=1",
    headers:{
      "X-Mashape-Key" => ENV['X_Mashape_Key'],
      "Accept" => "application/json"
    }
  return response
end

def store_items
  Store.all.each do |store|
    puts build_search_params(store.items)
  end
end


def test_rec
  ings = build_search_params(Item.all[0,50])
  rec = find_recipies(ings)
  puts rec.body
end

test_rec
