class CreateRecipeIngredientLists < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredient_lists do |t|
      t.belongs_to :ingredient, foreign_key: true
      t.belongs_to :recipe, foreign_key: true

      t.timestamps
    end
  end
end
