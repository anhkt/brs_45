class Book < ApplicationRecord
  belongs_to :category, optional: true
  
  has_many :reviews, dependent: :destroy
  has_many :marks, dependent: :destroy
end
