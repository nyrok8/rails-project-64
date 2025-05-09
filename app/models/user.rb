# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, foreign_key: :creator_id, inverse_of: :creator, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  devise :database_authenticatable, :registerable, :rememberable, :validatable
end
