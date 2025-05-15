# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:two)
    sign_in @user

    @post = posts(:two)
  end

  test 'should create like' do
    count_before = PostLike.count
    post post_like_url(@post)
    count_after = PostLike.count

    assert { count_after == count_before + 1 }
    assert { @response.redirect? && @response.location == post_url(@post) }
  end

  test 'should destroy like' do
    PostLike.create!(post: @post, user: @user)
    count_before = PostLike.count
    delete post_like_url(@post)
    count_after = PostLike.count

    assert { count_after == count_before - 1 }
    assert { @response.redirect? && @response.location == post_url(@post) }
  end

  test 'should redirect create when not logged in' do
    sign_out :user
    post post_like_url(@post)
    assert { @response.redirect? && @response.location == new_user_session_url }
  end

  test 'should redirect destroy when not logged in' do
    PostLike.create!(post: @post, user: @user)
    sign_out :user
    delete post_like_url(@post)
    assert { @response.redirect? && @response.location == new_user_session_url }
  end
end
