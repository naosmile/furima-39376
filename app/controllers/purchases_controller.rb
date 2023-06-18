class PurchasesController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :contributor_confirmation

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    #  binding.pry
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    @item = Item.find(params[:item_id])
    return unless @item.user_id == current_user.id || !@item.purchase.nil?

    redirect_to root_path
  end
end
