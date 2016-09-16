class UsersController < ApplicationController

  # def index
  # end

  # def new
  # end

  def show
    @user = User.find(params[:id])
    redirect_to user_experiments_path(@user)
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:username, :password, :email)
  # end
end
