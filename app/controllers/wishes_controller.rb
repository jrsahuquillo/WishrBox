class WishesController < ApplicationController

    def index
      @user = User.find(params[:user_id])
      @wishes = @user.wishes
    end
end
