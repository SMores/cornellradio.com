class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_access, only: [:new, :create, :destroy, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User account created"
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    update_params = user_params
    if update_params[:upload]
      image_name = "dj#{@user.id}"+File.extname(update_params[:upload].original_filename)
      save_image(update_params[:upload], image_name)
      update_params[:profile_pic] = "uploaded/#{image_name}"
    end
    update_params.delete(:upload)
    if update_params[:password] == ""
      update_params.delete(:password)
      update_params.delete(:password_confirmation)
    end
    if @user.update(update_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.level.to_i < 2
    end

    def correct_access
      redirect_to(root_url) unless current_user.level.to_i < 2
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :profile_pic, :password, :password_confirmation, :bio, :level, :upload)
    end
end
