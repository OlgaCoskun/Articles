class AddLikeToCountToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :like_count, :integer, default: 0
  end
end
