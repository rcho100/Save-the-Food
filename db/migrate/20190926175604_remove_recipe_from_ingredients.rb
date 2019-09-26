class RemoveRecipeFromIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_reference :ingredients, :recipe, foreign_key: true
  end
end
