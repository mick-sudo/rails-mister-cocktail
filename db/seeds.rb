require 'open-uri'
puts "destroy ingredient"
Ingredient.destroy_all

puts "destroy cocktail"
Cocktail.destroy_all

puts "create ingredient"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])

puts "create #{i.name}"
end