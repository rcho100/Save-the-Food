class RemoveMeasurementFromIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :measurement, :string
  end
end
