class BooksController < ApplicationController
  def index
      # 本を全件取得
      @books = Book.all
      @book = Book.new
  end

  def create
      @book = Book.new(book_params)
      if @book.save
        # 投稿に成功した場合
        flash[:notice] = 'Book was successfully created.'
        redirect_to book_path(@book.id)
      else
        @books = Book.all
        render :index
      end
  end

  def show
      @book = Book.find(params[:id])
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        # 編集に成功した場合
        flash[:notice] = 'Book was successfully updated.'
        redirect_to book_path
      else
        render :edit
      end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end

  private
  def book_params
      params.require(:book).permit(:title, :body)
  end

end
