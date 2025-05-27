# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.includes(:creator).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = @post.comments.build

    @liked_post = @post.likes.exists?(user: current_user)

    comments_tree = @post.comments.order(created_at: :desc).arrange
    @comments = PostComment.sort_by_ancestry(comments_tree)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = t('.success')
      redirect_to @post
    else
      flash.now[:alert] = t('.failure')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
