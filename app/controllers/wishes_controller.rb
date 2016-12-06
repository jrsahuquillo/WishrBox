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

    def edit
      @user = User.find params[:user_id]
      @wish = @user.wishes.find params[:id]
    end

    def update
    @user = User.find_by(id: params[:user_id])
    @wish = @user.wishes.find_by(id: params[:id])

    if @wish.update(wish_params)
      redirect_to "/users/#{@user.id}/wishes"
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @wish = @user.wishes.find_by(id: params[:id]).destroy
    redirect_to action: :index, user_id: @user.id
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @wish = Wish.find_by(id: params[:id])
    unless @wish
      render 'No products found'
    end
  end

private

  def wish_params
    params.require(:wish).permit(:title, :description, :link, :price)
  end

end
