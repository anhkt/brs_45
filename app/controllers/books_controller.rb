class BooksController < ApplicationController
  before_action :find_book, only: :show

  def index
    @books = Book.paginate page: params[:page]
  end

  def show
  end

  private
  def find_book
    @book = Book.find_by id: params[:id]
    if @book.nil?
      flash[:danger] = t ".danger"
      redirect_to categories_path
    end
  end
end
