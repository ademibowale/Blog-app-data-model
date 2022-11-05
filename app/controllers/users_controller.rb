class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = User.includes(:comments).find(params[:id].to_i).recent_posts
  end
end
