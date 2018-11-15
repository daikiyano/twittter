class UsersController < ApplicationController
    before_action :authenticate_user! ,only:[:index,:edit,:update]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

end
