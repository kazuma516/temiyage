class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #ログインしていないユーザーがトップ画面ではなく、ログイン画面に遷移す設定のコード
  
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @item = Item.all #includes(:user).favorite('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  #def show  
  #end

  #def edit
    #if @item.user_id == current_user.id 
      #redirect_to root_path
    #end
  #end

  #def update
    #if @item.update(item_params)
      #redirect_to item_path(@item)
    #else
     # render :edit
    #end
  #end

  #def destroy
    
    #if @item.user_id == current_user.id
     # @item.destroy
      #redirect_to root_path
    #else
      #redirect_to root_path
    #end
  #end

 private

  def item_params
    params.require(:item).permit(:image, :title, :introduction, :price_id, :category_id, :buy_prefecture_id, :season_id, ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
