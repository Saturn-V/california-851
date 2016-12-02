class IssuesController < ApplicationController
  def index
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      flash[:success] = 'Issue Created'
      redirect_to pages_home_path
    else
      redirect_to :back
      flash[:error] = 'Issue failed to be created'
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:title, :description)
  end
end
