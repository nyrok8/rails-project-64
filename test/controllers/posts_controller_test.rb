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
    assert { @response.status == 200 }
  end

  test 'should get new' do
    get new_post_url
    assert { @response.status == 200 }
  end

  test 'should show post' do
    get post_url(@post)
    assert { @response.status == 200 }
  end

  test 'should create post' do
    count_before = Post.count
    post posts_url, params: { post: @post_params }
    count_after = Post.count

    assert { count_after == count_before + 1 }
    assert { @response.redirect? && @response.location == post_url(Post.last) }
  end

  test 'should not create post with invalid data' do
    invalid_params = {
      title: '123',
      body: '123',
      category_id: @category.id
    }

    count_before = Post.count
    post posts_url, params: { post: invalid_params }
    count_after = Post.count

    assert { count_after == count_before }
    assert { @response.status == 422 && !@response.redirect? }
  end

  test 'should redirect new when not logged in' do
    sign_out :user
    get new_post_url
    assert { @response.redirect? && @response.location == new_user_session_url }
  end

  test 'should redirect create when not logged in' do
    sign_out :user
    post posts_url, params: { post: @post_params }
    assert { @response.redirect? && @response.location == new_user_session_url }
  end
end
