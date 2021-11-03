# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[show following follower]

  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
  end

  def following
    @followings = @user.followings
  end

  def follower
    @followers = @user.followers
  end

  private
  
  def find_user
    @user = User.find(params[:id])
  end
end
