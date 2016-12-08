class UsersController < ApplicationController
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  # GET /users
  def index
    @users = User.order(birthday: :asc).limit(15)
  end

  # GET /users/:id
  def show
    @user = current_user
    unless @user
      render "no_users_found"
    end
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

  private

    def user_params
      params.require(:user).permit(:name, :email, :preferences, :birthday, :avatar)
    end

    def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end

end
