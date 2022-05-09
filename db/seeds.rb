# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


35.times do 
  name = Faker::Coffee.blend_name
  vendor = Faker::Coffee.origin
  quantity = rand(0..99)
  price = Faker::Number.between(from: 5.00, to: 20.99).round(2)
  description = Faker::Coffee.notes
  category = Faker::Coffee.variety
  user_id = 1
  Item.create(
    name: name, 
    vendor: vendor, 
    quantity: quantity, 
    price: price,
    description: description, 
    category: category,
    user_id: user_id
  )
end


  # t.string "name" # Faker::Coffee.blend_name #=> "Summer Solstice"
  # t.string "vendor" # Faker::Coffee.origin #=> "Antigua, Guatemala"
  # t.integer "quantity"
  # t.decimal "price"
  # t.text "description" # Faker::Coffee.notes #=> "balanced, silky, marzipan, orange-creamsicle, bergamot"
  # t.string "category" # Faker::Coffee.variety #=> "Pacas"
  # t.integer "user_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.index "\"location_id\"", name: "index_items_on_location_id"