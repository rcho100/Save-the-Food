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
RecipeIngredientList.destroy_all
Recipe.destroy_all
Review.destroy_all
User.destroy_all

#Users
4.times do
    User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password
    )
end

@user_1 = User.all[0]
@user_2 = User.all[1]
@user_3 = User.all[2]
@user_4 = User.all[3]

puts "#{User.all.count} users created"

#Recipes
Recipe.create!(
        name: Faker::Food.dish,
        servings: Faker::Number.digit,
        time: Faker::Number.between(from: 10, to: 50),
        directions: Faker::Lorem.sentence,
        user_id: @user_1.id
    )

Recipe.create!(
        name: Faker::Food.dish,
        servings: Faker::Number.digit,
        time: Faker::Number.between(from: 10, to: 50),
        directions: Faker::Lorem.sentence,
        user_id: @user_1.id
    )

Recipe.create!(
        name: Faker::Food.dish,
        servings: Faker::Number.digit,
        time: Faker::Number.between(from: 10, to: 50),
        directions: Faker::Lorem.sentence,
        user_id: @user_2.id
    )

Recipe.create!(
        name: Faker::Food.dish,
        servings: Faker::Number.digit,
        time: Faker::Number.between(from: 10, to: 50),
        directions: Faker::Lorem.sentence,
        user_id: @user_3.id
    )

Recipe.create!(
        name: Faker::Food.dish,
        servings: Faker::Number.digit,
        time: Faker::Number.between(from: 10, to: 50),
        directions: Faker::Lorem.sentence,
        user_id: @user_3.id
    )
Recipe.create!(
        name: Faker::Food.dish,
        servings: Faker::Number.digit,
        time: Faker::Number.between(from: 10, to: 50),
        directions: Faker::Lorem.sentence,
        user_id: @user_4.id
    )

recipe_1 = Recipe.all[0]
recipe_2 = Recipe.all[1]
recipe_3 = Recipe.all[2]
recipe_4 = Recipe.all[3]
recipe_5 = Recipe.all[4]
recipe_6 = Recipe.all[5]

puts "#{Recipe.all.count} recipes created"

#Ingredients
10.times do
    Ingredient.create!(name: Faker::Food.ingredient)
end

puts "#{Ingredient.all.count} ingredients created"


#RecipeIngredientLists
#recipe_id: 1
RecipeIngredientList.create!(
    ingredient_id: 1,
    recipe_id: recipe_1.id
)
RecipeIngredientList.create!(
    ingredient_id: 2,
    recipe_id: recipe_1.id
)
RecipeIngredientList.create!(
    ingredient_id: 3,
    recipe_id: recipe_1.id
)
RecipeIngredientList.create!(
    ingredient_id: 4,
    recipe_id: recipe_1.id
)
RecipeIngredientList.create!(
    ingredient_id: 5,
    recipe_id: recipe_1.id
)
#recipe_id: 2
RecipeIngredientList.create!(
    ingredient_id: 5,
    recipe_id: recipe_2.id
)
RecipeIngredientList.create!(
    ingredient_id: 7,
    recipe_id: recipe_2.id
)
RecipeIngredientList.create!(
    ingredient_id: 2,
    recipe_id: recipe_2.id
)
RecipeIngredientList.create!(
    ingredient_id: 10,
    recipe_id: recipe_2.id
)
#recipe_id: 3
RecipeIngredientList.create!(
    ingredient_id: 3,
    recipe_id: recipe_3.id
)
RecipeIngredientList.create!(
    ingredient_id: 9,
    recipe_id: recipe_3.id
)
RecipeIngredientList.create!(
    ingredient_id: 10,
    recipe_id: recipe_3.id
)
RecipeIngredientList.create!(
    ingredient_id: 6,
    recipe_id: recipe_3.id
)
puts "#{RecipeIngredientList.all.count} recipe_ingredient_list created"


#Reviews
Review.create!(
    rating: Faker::Number.between(from: 1, to: 5),
    content: Faker::Lorem.sentence,
    user_id: @user_1.id,
    recipe_id: recipe_3.id
)
Review.create!(
    rating: Faker::Number.between(from: 1, to: 5),
    content: Faker::Lorem.sentence,
    user_id: @user_2.id,
    recipe_id: recipe_1.id
)
Review.create!(
    rating: Faker::Number.between(from: 1, to: 5),
    content: Faker::Lorem.sentence,
    user_id: @user_2.id,
    recipe_id: recipe_2.id
)
Review.create!(
    rating: Faker::Number.between(from: 1, to: 5),
    content: Faker::Lorem.sentence,
    user_id: @user_3.id,
    recipe_id: recipe_1.id
)
Review.create!(
    rating: Faker::Number.between(from: 1, to: 5),
    content: Faker::Lorem.sentence,
    user_id: @user_3.id,
    recipe_id: recipe_2.id
)
Review.create!(
    rating: Faker::Number.between(from: 1, to: 5),
    content: Faker::Lorem.sentence,
    user_id: @user_3.id,
    recipe_id: recipe_3.id
)
Review.create!(
    rating: Faker::Number.between(from: 1, to: 5),
    content: Faker::Lorem.sentence,
    user_id: @user_4.id,
    recipe_id: recipe_1.id
)
Review.create!(
    rating: Faker::Number.between(from: 1, to: 5),
    content: Faker::Lorem.sentence,
    user_id: @user_2.id,
    recipe_id: recipe_5.id
)
Review.create!(
    rating: Faker::Number.between(from: 1, to: 5),
    content: Faker::Lorem.sentence,
    user_id: @user_1.id,
    recipe_id: recipe_5.id
)
puts "#{Review.all.count} reviews created"