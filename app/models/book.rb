class Book < ApplicationRecord

  has_many :book_comments
  belongs_to :user

  has_one_attached :image

  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true

   acts_as_taggable
end
