# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
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
    assert_difference('PostComment.count', 1) do
      post post_comments_url(@post), params: @comment_params
    end

    created = @post.comments.find_by(@comment_params[:post_comment].merge(user_id: @user.id))
    assert { created }

    assert_redirected_to post_url(@post)
  end

  test 'should not create comment with invalid data' do
    invalid_params = { post_comment: { content: '' } }

    assert_no_difference('PostComment.count') do
      post post_comments_url(@post), params: invalid_params
    end

    assert_redirected_to post_url(@post)
  end

  test 'should redirect create when not logged in' do
    sign_out :user

    assert_no_difference('PostComment.count') do
      post post_comments_url(@post), params: @comment_params
    end

    assert_redirected_to new_user_session_url
  end
end
