class UsersController < ApplicationController
  before_action:authenticate_user!

  def index
    @users = User.order(birthday: :asc).limit(15)
  end

  def show
    @user = User.find_by(id: params[:id])
    unless @user
      render "no_users_found"
    end
  end

  def new
    @user = User.new
    render "new"
  end

  def create
    @user = User.new(
      name: params[:user][:name],
      email: params[:user][:email],
      birthday: params[:user][:birthday],
      preferences: params[:user][:preferences])

    if @user.save
      flash[:notice] = "New user added successfully"
      redirect_to "/users/#{@user.id}"
    else
      render "/users/new"
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      redirect_to action: :index, id: @user.id
    else
      render "edit"
    end
  end

  def destroy
  end

  def profile
    @user = current_user
    render 'users/profile'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :preferences, :birthday)
    end

end
