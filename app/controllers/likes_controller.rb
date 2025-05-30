# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    post.likes.find_or_create_by(user: current_user)

    redirect_to post
  end

  def destroy
    post = Post.find(params[:post_id])
    like = post.likes.find_by(user: current_user)

    like&.destroy
    redirect_to post
  end
end
