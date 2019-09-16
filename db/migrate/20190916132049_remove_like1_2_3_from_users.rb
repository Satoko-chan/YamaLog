class RemoveLike123FromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :like1, :string
    remove_column :users, :like2, :string
    remove_column :users, :like3, :string
    add_column :users, :user_like, :string
  end
end
