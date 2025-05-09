# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'faker'
require 'minitest/power_assert'

module ActiveSupport
  class TestCase
    parallelize(workers: :number_of_processors)
  end
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @password = Faker::Internet.password(min_length: 6)

    @user = User.create!(
      email: Faker::Internet.unique.email,
      password: @password,
      password_confirmation: @password
    )
    sign_in @user, scope: :user

    @category = Category.create!(name: Faker::Book.unique.genre)

    @post = Post.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      body: Faker::Lorem.paragraph_by_chars(number: 300),
      creator: @user,
      category: @category
    )
  end
end
