class BooksController < ApplicationController
  before_action :authentication_admin_user


  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.user = current_user

    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_path
  end

  def index
    if params[:id]
     tag_name = Book.all.tag_counts.find(params[:id]).name
     @books = Book.all.tagged_with(tag_name).order(created_at: :asc).page(params[:page]).per(12)
    else
      @books = Book.all.order(created_at: :asc).page(params[:page]).per(12)
    end
      # 全てのタグを取得したいのですべてのBookデータを配列に格納する
     @bookAll = Book.all
     # book配列に紐づいている、tagをすべて取得する
     @tags_all = @bookAll.tag_counts_on(:tags)
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
    @book=Book.find(params[:id])
    @book_comment = BookComment.new
    if params[:id]
      #gsubでハイフンを取り除く
      result = RakutenWebService::Books::Book.search(isbn: @book.isbn.gsub("-", ""))
      #検索結果の配列の中から
    unless result.first.nil?
      @url = result.first['itemUrl']
      @l_img = result.first['largeImageUrl']
    else
      @url = nil
      @l_img = nil
    end
      #pp '----------------'
      # pp result
    end
  end


  private

  def books_params
    params.require(:book).permit(:title, :author, :isbn, :image, :tag_list, :outline, :comment)
  end
end
