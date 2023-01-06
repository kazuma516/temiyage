class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.all
  end

end
