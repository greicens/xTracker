class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @user = current_user
    category = Category.create(category_params)
    if category.save
      redirect_to categories_path
    end
  end

  def edit
    @category = Category.find_by_id(params[:id])
  end

  def update
    @category = Category.find_by_id(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
    else
      user.errors.full_messages.each do |message|
        flash[:error] = message
      end
    redirect_to categories_path
    end
  end

  def destroy
    @category = Category.find_by_id(params[:id])
    @category.destroy
    redirect_to categories_path
  end


  private
  def category_params
    params.require(:category).permit(:name)
  end
end
