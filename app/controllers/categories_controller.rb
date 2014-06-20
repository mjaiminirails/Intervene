class CategoriesController < ApplicationController

  def index
    @categories = Category.order('name asc').all
  end

  def new
    @category = Category.new
    @subcategories = Subcategory.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render new_category_path
    end
  end

  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(Category.params)
      redirect_to category_path(@category),
            notice: "Category updated successfully!!"
    else
      @err = @category.errors.full_messages
      redirect_to edit_category_path(@category),
            :flash => { notice: "Invalid. Category NOT updated.", errors: @err }
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to categories_path
  end

  def category_params
    params.require(:category).permit(:name)
  end

end