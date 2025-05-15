# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    resource_post
    @like = PostLike.new(post: @resource_post, user: current_user)

    @like.save
    redirect_to @resource_post
  end

  def destroy
    resource_post
    @like = PostLike.find_by(post: @resource_post, user: current_user)

    @like&.destroy
    redirect_to @resource_post
  end
end
