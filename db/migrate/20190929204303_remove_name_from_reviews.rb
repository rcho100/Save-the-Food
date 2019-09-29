class RemoveNameFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :name, :string
  end
end
