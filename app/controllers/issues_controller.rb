class IssuesController < ApplicationController

  before_action :authorize, except: [:show]
  before_action :authorize_owner, only: [:edit, :update]

  def show
    @issue = Issue.find(params[:id])
  end

  def new
    @issue = current_user.issues.build
  end

  def create
    @issue = current_user.issues.build(issue_params)
    if @issue.save
      flash[:success] = 'Issue Created'
      redirect_to root_path
    else
      redirect_to :back
      flash[:error] = 'Issue failed to be created'
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])

    if @issue.update_attributes(issue_params)
      redirect_to root_path
      flash[:success] = "Issue Updated"
    else
      redirect_to :back
      flash[:error] = "Issue failed to update"
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:title, :description)
  end

  def authorize_owner
    @issue = Issue.find(params[:id])
    redirect_to root_path unless current_user == @issue.user
  end
end
