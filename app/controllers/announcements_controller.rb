class AnnouncementsController < ApplicationController

  before_action :authorize
  before_action :authorize_owner, only: [:edit, :update]
  before_action :authorize_admin

  def new
    @announcement = current_user.announcements.build
  end

  def create
    @announcement = current_user.announcements.build(announcement_params)
    if @announcement.save
      flash[:success] = 'Announcement Created'
      redirect_to root_path
    else
      redirect_to :back
      flash[:error] = 'Announcement failed to be created'
    end
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    @announcement = Announcement.find(params[:id])

    if @announcement.update_attributes(announcement_params)
      redirect_to root_path
      flash[:success] = "Announcement Updated"
    else
      redirect_to :back
      flash[:error] = "Announcement failed to update"
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def announcement_params
    params.require(:announcement).permit(:body)
  end

  def authorize_owner
    @announcement = Announcement.find(params[:id])
    redirect_to root_path unless current_user == @announcement.user
  end
end
