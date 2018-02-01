require 'json'
require 'unirest'


def build_search_params(items)
  ingredient_list = []
  items.each do |item|
    if item.StandardTitle
      ingredient_list.push(item.StandardTitle.gsub(/_/, ' '))
    end
  end
  # %2C is ASCII code for a ','
  return ingredient_list.join('%2C')
end

def find_recipies(params)
  response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=true&ingredients=#{params}&limitLicense=false&number=50&ranking=1",
    headers:{
      "X-Mashape-Key" => ENV['X_Mashape_Key'],
      "Accept" => "application/json"
    }
  return response
end

def load_recipes
  Store.all.each do |store|
    params = build_search_params(store.items)
    response = find_recipies(params)
    add_to_recipes(response.body, store.id)
    # add_to_recipe_items(response.body, store.id)
  end
end

def add_to_recipes(recipes, store_id)
  recipes.each do |recipe|
    r = Recipe.new
    r.rec_id = recipe['id']
    r.title = recipe['title']
    r.image = recipe['image']
    r.usedIngredientCount = recipe['usedIngredientCount']
    r.missedIngredientCount = recipe['missedIngredientCount']
    r.likes = recipe['likes']
    r.store_id = store_id
    r.save
  end
end

def add_to_recipe_items(recipes, store_id)
  store = Store.find(store_id)
  recipes.each do |rec|
    rec_id = Recipe.find_by(rec_id: rec['id']).id
    rec['usedIngredients'].each do |ingred|
      if store.items.find_by(usda: ingred['id'])
        item_id = store.items.find_by(usda: ingred['id']).id
        r = RecipeItem.new
        r.recipe_id = rec_id
        r.item_id = item_id
        r.save
      end
    end
  end
end


def test_rec
  ings = build_search_params(Item.all[0,50])
  rec = find_recipies(ings)
  puts rec.body
end

load_recipes
