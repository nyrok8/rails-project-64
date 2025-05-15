# frozen_string_literal: true

class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def resource_post
    @resource_post ||= Post.find(params[:post_id])
  end
end
