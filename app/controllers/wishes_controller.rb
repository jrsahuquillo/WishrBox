class WishesController < ApplicationController
  before_action :authenticate_user!


    def index
      # if params[:user_id]
      #   @user = User.find(params[:user_id])
      # else
      #   @user = current_user
      # end
      @user = current_user
      @wishes = @user.wishes.order('favorite desc')

    end

    def new
      @user = current_user
      # @user = User.find(params[:user_id])
      @wish = @user.wishes.new
    end

    def create
      @user = current_user
      # @user = User.find(params[:user_id])
      @wish = @user.wishes.new(wish_params)

        if @wish.save
          flash[:notice] = "Deseo añadido a tu WishrBox"
          redirect_to user_wishes_path(@user)
        else
          render "new"
        end
    end

    def edit
      @user = current_user
      # @user = User.find params[:user_id]
      @wish = @user.wishes.find params[:id]
    end

    def update
      @user = current_user
      # @user = User.find_by(id: params[:user_id])
      @wish = @user.wishes.find_by(id: params[:id])

      if @wish.update(wish_params)
        redirect_to "/users/#{@user.id}/wishes"
      else
        render "edit"
      end
    end

    def destroy
      @user = current_user
      # @user = User.find_by(id: params[:user_id])
      @wish = @user.wishes.find_by(id: params[:id]).destroy
      redirect_to action: :index, user_id: @user.id
    end

    def show
      # @user = User.find_by(id: params[:user_id])
      @wish = Wish.find_by(id: params[:id])
      @user = @wish.user
      unless @wish
        render 'No products found'
      end

    def favorite_wishes
      wishes.where(favorite: true)
    end
  end

private

  def wish_params
    params.require(:wish).permit(:title, :description, :link, :price, :image, :locked, :public, :favorite)
  end

end
