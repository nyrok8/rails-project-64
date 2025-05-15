# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    resource_post
    @comment = PostComment.new(comment_params)
    @comment.post = @resource_post
    @comment.user = current_user

    if @comment.save
      redirect_to @resource_post, notice: t('.success')
    else
      redirect_to @resource_post, notice: t('.failure')
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
