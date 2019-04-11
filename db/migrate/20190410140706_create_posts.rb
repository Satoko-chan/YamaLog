class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :image_name
      t.string :title
      t.text :comment

      t.timestamps
    end
  end
end
