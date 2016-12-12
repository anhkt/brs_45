class Book < ApplicationRecord
  belongs_to :category, optional: true
  
  has_many :reviews, dependent: :destroy
  has_many :marks, dependent: :destroy

  validates :title, presence: true
  validates :page,
    numericality: {greater_than_or_equal_to: 0, only_integer: true}
  validates :author, presence: true
  validates :description, presence: true
  
  scope :order_by, ->{order created_at: :DESC}
end
