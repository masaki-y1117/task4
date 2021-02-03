class RelationshipsController < ApplicationController
  
  def create
     followering = current_user.follow(@user)
     followering.save
     redirect_to @user
  end
  
  def destroy
  end
end
