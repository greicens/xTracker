class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    category = Category.create(category_params)
      if !category.save
      category.errors.full_messages.each do |message|
        flash[:error] = message
        redirect_to new_entry_path
      end
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
