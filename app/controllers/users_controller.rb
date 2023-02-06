class UsersController <
  def show
		@user = User.find(params[:id])
  end

  def hide
		@user = User.find(params[:id])
		#is_deletedカラムにフラグを立てる(defaultはfalse)
    	@user.update(is_deleted: true)
    	#ログアウトさせる
    	reset_session
    	flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    	redirect_to root_path
  end

end
