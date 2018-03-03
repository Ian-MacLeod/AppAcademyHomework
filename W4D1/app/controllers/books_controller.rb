class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
  end

  def new
    # your code here
    render template: 'books/new.html.erb'
  end

  def create
    # your code here
    Book.create(book_params)
    redirect_to('/books/')
  end

  def destroy
    # your code here
    Book.find(params['id']).destroy
    redirect_to('/books/')
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
