# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user

    @post = posts(:one)
    @like = post_likes(:one)
  end

  test 'should create like' do
    assert_difference('PostLike.count', 1) do
      post post_likes_url(posts(:two))
    end

    created = PostLike.find_by(user: @user, post: posts(:two))
    assert { created }

    assert_redirected_to post_url(posts(:two))
  end

  test 'should destroy like' do
    assert_difference('PostLike.count', -1) do
      delete post_like_url(@post, @like)
    end

    assert_redirected_to post_url(@post)
  end

  test 'should redirect create when not logged in' do
    sign_out :user

    assert_no_difference('PostLike.count') do
      post post_likes_url(@post)
    end

    assert_redirected_to new_user_session_url
  end

  test 'should redirect destroy when not logged in' do
    sign_out :user

    assert_no_difference('PostLike.count') do
      delete post_like_url(@post, @like)
    end

    assert_redirected_to new_user_session_url
  end
end
