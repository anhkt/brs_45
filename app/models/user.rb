class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, through: :review
  has_many :marks, dependent: :destroy
  has_many :ratings
  has_many :requests, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  class << self
    def from_omniauth token
      data = token.info
      user = User.find_by email: data["email"]
      unless user
        password = Devise.friendly_token[0,20]
        user = User.create name: data["name"], email: data["email"],
          gravatar: data["image"], password: password,
          password_confirmation: password
      end
      user
    end
  end
end
