# frozen_string_literal: true

class Post
  class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user

    has_ancestry orphan_strategy: :destroy

    validates :content, presence: true, length: { in: 5..400 }
  end
end
