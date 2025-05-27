# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :post, inverse_of: :comments
  belongs_to :user, inverse_of: :comments

  has_ancestry orphan_strategy: :destroy

  validates :content, presence: true, length: { in: 5..400 }
end
