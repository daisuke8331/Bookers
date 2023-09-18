class BooksController < ApplicationController
  def index

    @books = Book.all

    @booknew = Book.new

  end

  def create

    @booknew = Book.new(book_params)
    if @booknew.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@booknew.id)
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
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      #@book = Book.find(params[:id]) エラーメッセージを上書きしてしまっていたので削除
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was succesfully destroyed"
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
