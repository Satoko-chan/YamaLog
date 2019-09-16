class AddLike1Like2Like3AboutUserToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :like1, :string
    add_column :users, :like2, :string
    add_column :users, :like3, :string
    add_column :users, :aboutUser, :text
  end
end
