class PurchasesController < ApplicationController

  def index
    @purchases_address = PurchaseAddress.new
  end

  def create
    @purchases_address = PurchaseAddress.new(purchases_params)
    # @purchase_address = item.build_purchase_address(purchase_params)
    if @purchases_address.valid?
       @purchases_address.save
       redirect_to root_path
    else
     render :index
    end
  end


  private

  def purchases_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :purchases_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
