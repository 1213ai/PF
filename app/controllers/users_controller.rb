class UsersController < ApplicationController
 before_action :ensure_correct_user, only: [:edit, :update]
 before_action :authenticate_user!, except: [:index]


  def show
    @user = User.find(params[:id])
  end
  
  def index
    redirect_to new_user_registration_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

#他のユーザーが編集
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
