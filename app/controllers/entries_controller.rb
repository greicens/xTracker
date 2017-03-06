class EntriesController < ApplicationController
  before_action :require_login

  def index
    @user = User.find_by_id(params[:user_id])
    category = Category.find_by_name(params[:category])
    @entries = @user.entries.where(nil) #creates an anonymous scope
    @entries = @entries.category(category.id) if params[:category].present?
    @entries = @entries.vendor(params[:vendor]) if params[:vendor].present?
    @entries = @entries.entry_type(params[:entry_type]) if params[:entry_type].present?
    @entries = @entries.payment_type(params[:payment_type]) if params[:payment_type].present?
  end

  def new
    @entry = Entry.new
    @user = current_user
  end
  def create
    @user = current_user
    @entry = Entry.create(entry_params)
    if @entry.save
      @user.entries << @entry
      redirect_to user_entries_path(@user)
    else
      @entry.errors.full_messages.each do |message|
        flash[:error] = message
      end
      redirect_to new_user_entry_path(@user)
    end
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @entry = @user.entries.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:user_id])
    @entry = Entry.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:user_id])
    @entry = Entry.find_by_id(params[:id])
    @entry.update(entry_params)
    if @entry.update(entry_params)
      # Insert flash message errors
      redirect_to user_entries_path(@user)
    else
      @entry.errors.full_messages.each do |message|
        flash[:error] = message
      end
      redirect_to edit_user_entry_path(@user,@entry)
    end
  end

  def destroy
    @user = User.find_by_id(params[:user_id])
    entry = Entry.find_by_id(params[:id])
    entry.destroy
    redirect_to user_entries_path(@user)
  end

  private

  def entry_params
    params.require(:entry).permit(:receipt,:amount, :day, :payment_type, :notes, :vendor, :recurring, :category_id )
  end
end
