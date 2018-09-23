class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :body, :com_body
  end
end
