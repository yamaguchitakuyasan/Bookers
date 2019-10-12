class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
  if book.save
       redirect_to book_path(book.id)
       flash[:notice] = 'Book was successfully created.'
     else
      @book = Book.new
      @books = Book.all
      render :index
  end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:update] = 'Book was successfully updated.'
    redirect_to book_path(book.id)
  end

  def destroy
     @book = Book.find(params[:id])
     @book.destroy
     flash[:destroy] = 'Book was successfully destroyed.'
     redirect_to books_path
  end

  private
  def book_params
      params.require(:book).permit(:title, :body)
    end

end