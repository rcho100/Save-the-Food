class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name
      t.integer :rating
      t.text :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :recipe, foreign_key: true

      t.timestamps
    end
  end
end
