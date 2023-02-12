class BookCommentsController < ApplicationController

  def create
    @book=Book.find(params[:book_id])
    comment=BookComment.new(book_comment_params)
    comment.book_id=@book.id
    comment.user_id = current_user.id
    comment.save!
     redirect_to book_path(@book.id)
  end

  def destroy
   BookComment.find(params[:book_id]).destroy
   @book = Book.find(params[:id])
    redirect_to book_path(@book.id)
  end

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
