class LikesController < ApplicationController

  def create
    @like = Like.new(user_id: current_user.id, tweeet_id: params[:tweeet_id])
    @like.save
    redirect_to tweeets_path
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, tweeet_id: params[:tweeet_id])
    @like.destroy
    redirect_to tweeets_path
  end
end
