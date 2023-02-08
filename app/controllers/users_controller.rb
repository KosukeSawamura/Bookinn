class UsersController < ApplicationController


    def hide
		@user = User.find(params[:id])
    	@user.update(is_deleted: true)
    	reset_session
    	redirect_to root_path
	end



end
