class Post < ApplicationRecord
  belongs_to :user
  has_many :post_books
  has_many :books, through: :post_books
end
