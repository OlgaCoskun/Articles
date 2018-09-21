class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.text :topic
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
