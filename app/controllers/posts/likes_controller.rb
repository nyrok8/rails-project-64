# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    resource_post
    @like = Post::Like.new(post: @resource_post, user: current_user)

    @like.save
    redirect_to @resource_post
  end

  def destroy
    resource_post
    @like = Post::Like.find_by(post: @resource_post, user: current_user)

    @like.destroy
    redirect_to @resource_post
  end
end
