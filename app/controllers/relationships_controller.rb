class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to request.referer
  end

  def follow_index
    @user = User.find(params[:user_id])
    @follow = @user.following_user
  end

  def follower_index
    @user = User.find(params[:user_id])
    @follow = @user.follower_user
  end

end
