# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json_file = open(url).read
ingredients = JSON.parse(json_file)

# puts ingredients["drinks"].first["strIngredient1"] --> para pegar o primeiro valor
puts ingredients["drinks"]

#vc descobre que eh uma hash com arrays de hashes

# sendo uma array, ele vai poder usar o metodo each com um key e um value.
# Mas eu quero o value, entao qndo ele passar, ele vai criar um metodo ingredients apenas com o valor da hash.
ingredients['drinks'].each do |key, value|
  Ingredient.create(name: value) # como no exemplo do kitt, mas eu queropegar o value do meu json
end


