# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# To Refresh Data:
#
# 1. include new store_info and store_items
# 2. run db:seed
# 3. Generate_Ingredient_json
# 4. load_clean_ingreds
# 5. generate_recieipes


require 'csv'


def export_recipes
  CSV.open('lib/seeds/Recipe.csv', 'wb') do |csv|
    csv << Recipe.attribute_names
    Recipe.all.each do |rec|
      csv << rec.attributes.values
    end
  end
end


def destroy_records
  Recipe.destroy_all
  CartItem.destroy_all
  Item.destroy_all
  Store.destroy_all
end

def load_stores
  stores_csv_text = File.read(Rails.root.join('lib', 'seeds', 'store_info.csv'))
  stores_csv = CSV.parse(stores_csv_text, headers: true, encoding: 'ISO-8859-1')

  stores_csv.each do |row|
    s = Store.new
    s.name = row['name']
    s.location = row['location']
    s.lat = row['lat']
    s.lng = row['lng']
    s.save
  end
end


def load_items
  items_csv_text = File.read(Rails.root.join('lib', 'seeds', 'store_items.csv'))
  items_csv = CSV.parse(items_csv_text, headers: true, encoding: 'ISO-8859-1')

  items_csv.each do |row|
    t = Item.new
    t.title = row['title']
    t.quantity = row['Quantity']
    t.unit = row['Unit']
    t.price = row['Price']
    t.location = row['location']
    t.start_date = row['start_date']
    t.end_date = row['end_date']
    t.image = row['image']
    t.store_id = Store.first.id
    t.save
  end

  Item.all.each do |item|
   store = Store.find_by location: item.location
   item.store_id = store.id
   item.save
  end
end

destroy_records
load_stores
load_items
