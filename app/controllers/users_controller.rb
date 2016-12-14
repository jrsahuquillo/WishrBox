class UsersController < ApplicationController

  # GET /users
  def index
    @user = User.find_by(email: params[:search])
    unless @user
      render "no_users_found"
    end
    # @users = User.order(birthday: :asc).limit(15)
  end

  # GET /users/:id
  def show
    @user = User.find_by(id: params[:id])
    unless @user
      render "no_users_found"
    end
  end
  # GET /feed/
  def feed
    @followed = Following.where(user_id: current_user)
    @followed_user= User.where(id: @followed.pluck(:follow_id))

    # unless @user
    #   render "no_users_found"
    # end
  end

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
      WelcomeMailer.welcome_email(@user).deliver.now
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
    # @user = User.find_by(id: params[:id])
    @user = current_user

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


  def follow_to
    @followed = Following.new
    @followed.user_id = current_user.id
    @user = User.find_by(id: params[:id])
    @followed.follow_id = @user.id

      if @followed.save
        flash[:notice] = "Estás siguiendo la WishrBox de #{@user.name}"
        redirect_to user_wishes_path(@user)
      else
        flash[:notice] = "Ha habido algún error al seguir a #{@user.name}"
        redirect_to user_wishes_path(@user)
      end

  end

  def nofollow_to
      @user = User.find_by(id: params[:id])
      @followed = Following.find_by(user_id: current_user.id, follow_id: @user.id)
      if @followed.destroy
        flash[:notice] = "Ya no sigues a #{@user.name}"
        redirect_to user_wishes_path(@user)
      else
        flash[:notice] = "Ha habido algún error al dejar de seguir a #{@user.name}"
        redirect_to user_wishes_path(@user)
      end
  end



  private

    def user_params
      params.require(:user).permit(:name, :email, :preferences, :birthday, :avatar)
    end

end
