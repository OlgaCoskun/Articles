class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.boolean :moderator_has, default: true
      t.string :link

      t.timestamps
    end
  end
end
