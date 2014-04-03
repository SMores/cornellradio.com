class ShowUsersController < ApplicationController
  before_action :set_show_user, only: [:show, :edit, :update, :destroy]

  # GET /show_users
  # GET /show_users.json
  def index
    @show_users = ShowUser.all
  end

  # GET /show_users/1
  # GET /show_users/1.json
  def show
  end

  # GET /show_users/new
  def new
    @show_user = ShowUser.new()
  end

  # GET /show_users/1/edit
  def edit
  end

  # POST /show_users
  # POST /show_users.json
  def create
    @show_user = ShowUser.new(show_user_params)

    respond_to do |format|
      if @show_user.save
        format.html { redirect_to @show_user, notice: 'Show user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @show_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @show_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /show_users/1
  # PATCH/PUT /show_users/1.json
  def update
    respond_to do |format|
      if @show_user.update(show_user_params)
        format.html { redirect_to @show_user, notice: 'Show user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @show_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /show_users/1
  # DELETE /show_users/1.json
  def destroy
    @show_user.destroy
    respond_to do |format|
      format.html { redirect_to show_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show_user
      @show_user = ShowUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_user_params
      params.require(:show_user).permit(:user_id, :show_id)
    end
end
