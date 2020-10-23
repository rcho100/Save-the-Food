# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
##############################

Ingredient.destroy_all
RecipeIngredientList.destroy_all
Recipe.destroy_all
Review.destroy_all
User.destroy_all

#Users
User.create!(
    name: "George",
    email: Faker::Internet.email,
    password: Faker::Internet.password
)

User.create!(
    name: "Shelley",
    email: Faker::Internet.email,
    password: Faker::Internet.password
)

User.create!(
    name: "Harry",
    email: Faker::Internet.email,
    password: Faker::Internet.password
)

User.create!(
    name: "Monica",
    email: Faker::Internet.email,
    password: Faker::Internet.password
)

@user_1 = User.all[0]
@user_2 = User.all[1]
@user_3 = User.all[2]
@user_4 = User.all[3]

puts "#{User.all.count} users created"

#Recipes
Recipe.create!(
        name: Faker::Food.dish,
        servings: Faker::Number.between(from: 1, to: 6),
        time: Faker::Number.between(from: 10, to: 50),
        directions: Faker::Lorem.sentence,
        user_id: @user_1.id
    )

Recipe.create!(
        name: Faker::Food.dish,
        servings: Faker::Number.between(from: 1, to: 6),
        time: Faker::Number.between(from: 10, to: 50),
        directions: Faker::Lorem.sentence,
        user_id: @user_1.id
    )

Recipe.create!(
        name: Faker::Food.dish,
        servings: Faker::Number.between(from: 1, to: 6),
        time: Faker::Number.between(from: 10, to: 50),
        directions: Faker::Lorem.sentence,
        user_id: @user_2.id
    )

Recipe.create!(
        name: Faker::Food.dish,
        servings: Faker::Number.between(from: 1, to: 6),
        time: Faker::Number.between(from: 10, to: 50),
        directions: Faker::Lorem.sentence,
        user_id: @user_3.id
    )

Recipe.create!(
        name: Faker::Food.dish,
        servings: Faker::Number.between(from: 1, to: 6),
        time: Faker::Number.between(from: 10, to: 50),
        directions: Faker::Lorem.sentence,
        user_id: @user_3.id
    )
Recipe.create!(
        name: Faker::Food.dish,
        servings: Faker::Number.between(from: 1, to: 6),
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