class UsersController < ApplicationController



  # GET /users
  def index
    @users = User.order(birthday: :asc).limit(15)
  end

  # GET /users/:id
  # def show
  #   @user = User.find_by(id: params[:id])
  #   unless @user
  #     render "no_users_found"
  #   end
  # end

  # GET /users/new
  def new
    @user = User.new
    render "new"
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "New user added successfully"
      redirect_to "/users/#{@user.id}"
    else
      render "/users/new"
    end
  end

  # GET /users/:id/edit
  def edit
    @user = current_user
    # @user = User.find params[:id]
  end

  # PATCH/PUT /users/:id
  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      redirect_to action: :profile, id: @user.id
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
