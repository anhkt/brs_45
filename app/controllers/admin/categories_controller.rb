class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.all
    if @categories.blank?
      flash[:danger] = t ".danger"
      redirect_to new_admin_category_path
    end 
  end

  def new
    @category = Category.new
  end

  def create
    if @category.save
      flash[:success] = t ".success"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".update_success"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t "delete_fail"
    end
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
