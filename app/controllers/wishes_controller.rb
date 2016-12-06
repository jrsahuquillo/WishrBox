class WishesController < ApplicationController

    def index
      @user = User.find(params[:user_id])
      @wishes = @user.wishes
    end

    def new
      @user = User.find(params[:user_id])
      @wish = @user.wishes.new
    end

    def create
      @user = User.find(params[:user_id])
        @wish = @user.wishes.new(wish_params)

        if @wish.save
          flash[:notice] = "Deseo añadido a tu WishrBox"
          redirect_to user_wishes_path(@user)
        else
          render "new"
        end
    end

private

  def wish_params
    params.require(:wish).permit(:title, :description, :link, :price)
  end

end
