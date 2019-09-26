# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
##############################

# create_table "ingredients", force: :cascade do |t|
#     t.string "name"
#     t.string "measurements"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

#   create_table "recipe_ingredient_lists", force: :cascade do |t|
#     t.integer "ingredient_id"
#     t.integer "recipe_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["ingredient_id"], name: "index_recipe_ingredient_lists_on_ingredient_id"
#     t.index ["recipe_id"], name: "index_recipe_ingredient_lists_on_recipe_id"
#   end

#   create_table "recipes", force: :cascade do |t|
#     t.string "name"
#     t.integer "servings"
#     t.integer "time"
#     t.text "directions"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.integer "user_id"
#     t.index ["user_id"], name: "index_recipes_on_user_id"
#   end

#   create_table "reviews", force: :cascade do |t|
#     t.string "name"
#     t.integer "rating"
#     t.text "content"
#     t.integer "user_id"
#     t.integer "recipe_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["recipe_id"], name: "index_reviews_on_recipe_id"
#     t.index ["user_id"], name: "index_reviews_on_user_id"
#   end

#   create_table "users", force: :cascade do |t|
#     t.string "name"
#     t.string "password_digest"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "email"
#   end

##############################

Ingredient.destroy_all
Recipe.destroy_all
Review.destroy_all
User.destroy_all

#Users
3.times do
  User.create!(
    name: Faker::Name.name ,
    email: Faker::Internet.email,
    password: Faker::Internet.password 
  )
end
puts "#{User.all.count} users created"

#Recipes
2.times do
    Recipe.create!(
        name: Faker::Food.dish, 
        servings: Faker::Number.number(digits: 1), 
        time: Faker::Number.number(digits: 2), 
        directions: Faker::Lorem.sentence(word_count: 4))
        user_id: 1
    )
  end
  
Recipe.create!(
    name: Faker::Food.dish, 
    servings: Faker::Number.number(digits: 1), 
    time: Faker::Number.number(digits: 2), 
    directions: Faker::Lorem.sentence(word_count: 6))
    user_id: 2
)

puts "#{Recipe.all.count} recipes created"

#Ingredients
10.times do
    Ingredient.create!(
        name: Faker::Food.ingredient
        measurements: Faker::Food.measurement
    )
end

puts "#{Ingredient.all.count} ingredients created"
