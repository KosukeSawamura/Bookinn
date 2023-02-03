class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
     @genres = Genre.all
    if params[:genre_id]
      @books=Book.where(genre_id: params[:genre_id]).order(created_at: :desc).page(params[:page]).per(16)
    else
      @books = Book.all.order(created_at: :asc).page(params[:page]).per(16)
    end
  end

  def show
  end

  def edit
  end

  private

  def books_params
    params.require(:book).permit(:title, :author, :isbn, :image, :tag_list)
  end
end
