class UsersController < ApplicationController
  before_action:authenticate_user!

  def index
    @users = User.order(birthday: :asc).limit(11)
  end



  def profile
    @user = current_user
    render 'users/profile'
  end

end
