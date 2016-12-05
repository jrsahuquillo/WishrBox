class UsersController < ApplicationController
  def index
    @users = User.order(birthday: :asc).limit(10)
  end
end
