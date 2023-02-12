class UsersController < ApplicationController


  def hide
		@user = User.find(params[:id])
    if current_user.email == 'guest@example.com'
      reset_session
      redirect_to :root
    else
    	@user.update(is_deleted: true)
    	reset_session
    	redirect_to root_path
    end
  end

	def edit
	  @user = User.find(params[:id])

	end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end