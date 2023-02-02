class Book < ApplicationRecord

  has_many :comment
  has_many :genre
end
