class ItemsController < ApplicationController
  def index
    # @items = Item.all
  end

  def new  
    
  end

  def create

  end

  

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
