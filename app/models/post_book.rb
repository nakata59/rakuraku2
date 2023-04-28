class PostBook < ApplicationRecord
  belongs_to :book
  belongs_to :post
end
