class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]
  before_action :correct_access, only: [:destroy, :create, :new, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  # GET /shows
  # GET /shows.json
  def index
    @shows = Show.paginate(page: params[:page], per_page: 14)
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
  end

  # GET /shows/new
  def new
    @show = Show.new
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows
  # POST /shows.json
  def create
    @show = Show.new(show_params)

    respond_to do |format|
      if @show.save
        @saved_show = Show.find_by(title: show_params[:title])
        params[:show_user].each_value do |user_id|
          puts "UserID is #{user_id} and ShowID is #{@saved_show.id}"
          ShowUser.new(user_id: user_id, show_id: @saved_show.id).save
        end
        format.html { redirect_to @show, notice: 'Show was successfully created.' }
        format.json { render action: 'show', status: :created, location: @show }
      else
        format.html { render action: 'new' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
    if @show.update(show_params)
      @saved_show = Show.find_by(title: show_params[:title])
        params[:show_user].each_value do |user_id|
          puts "UserID is #{user_id} and ShowID is #{@saved_show.id}"
          ShowUser.new(user_id: user_id, show_id: @saved_show.id).save
        end
      flash[:success] = "Show updated"
      redirect_to @show
    else
      render 'edit'
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to shows_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    def correct_access
      redirect_to(root_url) unless current_user.level.to_i < 2
    end

    def correct_user
      redirect_to(root_url) unless (current_user.level.to_i < 2 || current_user.shows.include?(@show))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_params
      params.require(:show).permit(:title, :profile_pic, :description, :fb_page, :tw_page, :ext_page, :start_time, :start_day, :end_time, :end_day, :on_air)
    end
end
