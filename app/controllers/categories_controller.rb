class CategoriesController < ApplicationController
  before_action :find_category, only: :show
  before_action :load_categories, only: :show

  def show
    @books = @category.books.order_by.paginate page: params[:page],
      per_page: Settings.per_page
  end

  private
  def find_category
    @category = Category.find_by id: params[:id]
    if @category.nil?
      flash[:danger] = t ".danger"
      redirect_to categories_path
    end
  end

  def load_categories
    @categories = Category.all
  end
end
