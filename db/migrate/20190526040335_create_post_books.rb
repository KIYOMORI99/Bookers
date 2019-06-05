class CreatePostBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :post_books do |t|
      t.string :title
      t.text :opinion
      t.integer :user_id
      t.timestamps
    end
  end
end
