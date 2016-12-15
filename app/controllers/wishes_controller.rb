class WishesController < ApplicationController
  before_action :authenticate_user!


    def index

      if params[:user_id]
        @user = User.find(params[:user_id])
        if current_user.id == params[:user_id].to_i
          @wishes = @user.wishes.order('favorite desc')
        else
          @wishes = @user.wishes.where(public:true).order('favorite desc')
        end
      else
        @user = current_user
        @wishes = @user.wishes.order('favorite desc')
      end

    end

    def new
      @user = current_user
      @wish = @user.wishes.new
    end

    def create
      @user = current_user
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
      @wish = @user.wishes.find params[:id]
    end

    def update
      @user = User.find(params[:user_id])
      @wish = @user.wishes.find_by(id: params[:id])

      if @wish.update(wish_params)
        redirect_to user_wishes_path(@user)
      else
        render "edit"
      end
    end

    def destroy
      @user = current_user
      @wish = @user.wishes.find_by(id: params[:id]).destroy
      redirect_to action: :index, user_id: @user.id
    end

    def show
      @wish = Wish.find_by(id: params[:id])

      unless @wish
        return render text: 'Not Found', status: '404'
      end

      if !@wish.public && @wish.user_id != current_user.id
        return render text: 'Not public', status: '404'
      end

      @user = @wish.user

  end

  def favorite_wishes
    @favorite_wishes = wishes.where(favorite: true)
  end

private

  def wish_params
    params.require(:wish).permit(:title, :description, :link, :price, :image, :locked, :public, :favorite)
  end

end
