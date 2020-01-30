class CreateCategoryPhotographers < ActiveRecord::Migration[5.2]
  def change
    create_table :category_photographers do |t|
      t.references :photographer, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
