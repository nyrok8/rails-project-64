# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user

    @post = posts(:one)

    @comment_params = {
      post_comment: {
        content: Faker::Lorem.sentence(word_count: 5)
      }
    }
  end

  test 'should create comment' do
    count_before = Post::Comment.count
    post post_comments_url(@post), params: @comment_params
    count_after = Post::Comment.count

    assert { count_after == count_before + 1 }
    assert { @response.redirect? && @response.location == post_url(@post) }
  end

  test 'should not create comment with invalid data' do
    invalid_params = { post_comment: { content: '' } }

    count_before = Post::Comment.count
    post post_comments_url(@post), params: invalid_params
    count_after = Post::Comment.count

    assert { count_after == count_before }
    assert { @response.redirect? && @response.location == post_url(@post) }
  end

  test 'should redirect create when not logged in' do
    sign_out :user
    post post_comments_url(@post), params: @comment_params
    assert { @response.redirect? && @response.location == new_user_session_url }
  end
end
