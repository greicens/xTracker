class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.create(category_params)
    if category.save
      redirect_to category_path(category)
    end
  end

  # def edit
  #   @category = Category.find_by_id(params[:id])
  # end
  #
  # def update
  #   @category = Category.find_by_id(params[:id])
  #   if @category.update(category_params)
  #     redirect_to new_entry_path
  #   else
  #     user.errors.full_messages.each do |message|
  #       flash[:error] = message
  #     end
  #     redirect_to new_entry_path
  #   end
  # end
  #


  private
  def category_params
    params.require(:category).permit(:name)
  end
end
