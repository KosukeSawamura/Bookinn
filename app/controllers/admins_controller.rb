class AdminsController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to edit_admin_path(@user)
    else
      edit_admin_path(@user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end

end
