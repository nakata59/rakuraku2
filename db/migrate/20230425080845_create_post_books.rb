class CreatePostBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :post_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
