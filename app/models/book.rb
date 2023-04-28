class Book < ApplicationRecord
  has_many :post_books
  has_many :posts, through: :post_books
end
