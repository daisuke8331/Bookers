class BooksController < ApplicationController
  def index

    @books = Book.all

    @booknew = Book.new

  end

  def create

    @booknew = Book.new(book_params)
    @booknew.save

    redirect_to book_path(@booknew.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params:id)
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end