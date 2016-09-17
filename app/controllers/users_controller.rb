class UsersController < ApplicationController

  # def index
  # end

  # def new
  # end

  def show
    @user = User.find(params[:id])
    redirect_to user_experiments_path(@user)
  end

  def create
    p '**************'
    p user_params
    @user = User.new(user_params)
    if @user.save
      redirect_to user_experiments_path(@user)
    else
      render ':devise/registrations/new'
    end
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  # private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
