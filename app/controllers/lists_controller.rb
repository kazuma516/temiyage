class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show]

  def index
    @item = Item.all
  end

  def show  
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end
end
