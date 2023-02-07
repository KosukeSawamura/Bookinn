class BooksController < ApplicationController
  before_action :authentication_admin_user


  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.user = current_user
    @book.save
    redirect_to book_path(@book.id)
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_path
  end

  def index
     @genres = Genre.all
    if params[:id]
     tag_name = Book.all.tag_counts.find(params[:id]).name
     @books = Book.all.tagged_with(tag_name).order(created_at: :asc).page(params[:page]).per(12)
    else
      @books = Book.all.order(created_at: :asc).page(params[:page]).per(12)
    end
      @tags = @books.tag_counts_on(:tags)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def show
    @newbook=Book.new
    @book=Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def edit
  end

  private

  def books_params
    params.require(:book).permit(:title, :author, :isbn, :image, :tag_list, :outline, :comment)
  end
end
