class UsersController < ApplicationController

  before_action :authorize
  before_action :authorize_admin, except: [:show, :index]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path
      flash[:success] = "User deleted!"
    end
  end
end
