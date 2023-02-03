class Book < ApplicationRecord

  has_many :comment
  has_many :genre

  has_one_attached :image

   acts_as_taggable
  acts_as_taggable_on :skills, :interests
end
