# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user

    @category = categories(:one)
    @post = posts(:one)

    @post_params = {
      title: Faker::Lorem.sentence(word_count: 3),
      body: Faker::Lorem.paragraph_by_chars(number: 300),
      category_id: @category.id
    }
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count', 1) do
      post posts_url, params: { post: @post_params }
    end

    created = Post.find_by(@post_params.merge(creator_id: @user.id))
    assert { created }

    assert_redirected_to post_url(created)
  end

  test 'should not create post with invalid data' do
    invalid_params = {
      title: '123',
      body: '123',
      category_id: @category.id
    }

    assert_no_difference('Post.count') do
      post posts_url, params: { post: invalid_params }
    end

    assert_response :unprocessable_entity
  end

  test 'should redirect new when not logged in' do
    sign_out :user

    get new_post_url
    assert_redirected_to new_user_session_url
  end

  test 'should redirect create when not logged in' do
    sign_out :user

    assert_no_difference('Post.count') do
      post posts_url, params: { post: @post_params }
    end

    assert_redirected_to new_user_session_url
  end
end
