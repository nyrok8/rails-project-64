# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, foreign_key: :creator_id, inverse_of: :creator, dependent: :destroy
  has_many :comments, class_name: 'PostComment', inverse_of: :user, dependent: :destroy
  has_many :likes, class_name: 'PostLike', inverse_of: :user, dependent: :destroy

  devise :database_authenticatable, :registerable, :rememberable, :validatable
end
