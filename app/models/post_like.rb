# frozen_string_literal: true

class PostLike < ApplicationRecord
  belongs_to :post, inverse_of: :likes, counter_cache: :likes_count
  belongs_to :user, inverse_of: :likes
end
