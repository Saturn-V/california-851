 class UpdatesController < ApplicationController

  before_action :authorize
  before_action :authorize_admin

  def new
    @issue = Issue.find(params[:issue_id])
    @update = @issue.updates.build
  end

  def create
    @issue = Issue.find(params[:issue_id])
    @update = @issue.updates.build(update_params)
    @update.user_id = current_user.id

    if @update.save
      flash[:success] = 'Update Created'
      redirect_to issue_path(@issue)
    else
      redirect_to :back
      flash[:error] = 'Update failed to be created'
    end
  end

  def edit
    @issue = Issue.find(params[:issue_id])
    @update = @issue.updates.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:issue_id])
    @update = Update.find(params[:id])

    if @update.update_attributes(update_params)
      redirect_to issue_path(@issue)
      flash[:success] = "Update Updated"
    else
      redirect_to :back
      flash[:error] = "Update failed to update"
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def update_params
    params.require(:update).permit(:body)
  end
end
