class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end
  def new
    @entry = Entry.new
  end
  def create
    entry = Entry.create(entry_params)
    if entry.save
      p entry
      redirect_to entry_path(entry)
    else
      entry.errors.full_messages.each do |message|
        flash[:error] = message
      end
      redirect_to new_entries_path
    end
  end

  def show
    @entry = Entry.find_by_id(params[:id])
  end

  def edit
    @entry = Entry.find_by_id(params[:id])
  end

  def update

    @entry = Entry.find_by_id(params[:id])
    if @entry.update(entry_params)
      # Insert flash message errors
      redirect_to entries_path
    end
  end

  def destroy
    @entry = Entry.find_by_id(params[:id])
    @entry.destroy
    redirect_to entries_path
  end

  private

  def entry_params
    params.require(:entry).permit(:receipt,:amount, :entry_type, :day, :payment_type, :notes, :vendor, :recurring )
  end
end
