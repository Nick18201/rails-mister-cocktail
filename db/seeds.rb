# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "destroy DB"
Ingredient.destroy_all

puts "parsing json and generating seed for ingredients"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

if Ingredient.count == 0
  user_serialized = open(url).read
  user = JSON.parse(user_serialized)
  user["drinks"].each do |ingredient|
    Ingredient.create!(name: ingredient["strIngredient1"])
  end
  puts "ingredients are seeded"
end

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
# Ingredient.create(name: "rhum")
# Ingredient.create(name: "sugar syrup")
# Ingredient.create(name: "vodka")
# Ingredient.create(name: "grenadine")
# Ingredient.create(name: "tequila")
# Ingredient.create(name: "orange Juice")
# Ingredient.create(name: "pepper")
# Ingredient.create(name: "tomato juice")
# Ingredient.create(name: "basilic")
# Ingredient.create(name: "tonic")
# Ingredient.create(name: "redbull")
# Ingredient.create(name: "whisky")
# Ingredient.create(name: "amaretto")
