# frozen_string_literal: true

class Post
  class Like < ApplicationRecord
    belongs_to :post
    belongs_to :user
  end
end
