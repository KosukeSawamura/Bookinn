class Book < ApplicationRecord

  has_many :book_comments

  has_one_attached :image

   acts_as_taggable
end
