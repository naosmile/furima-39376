class Item < ApplicationRecord

  validates :goods,              presence: true
  validates :explain,            presence: true
  validates :category_id ,       presence: true
  validates :situation_id,       presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id,      presence: true
  validates :number_of_date_id,  presence: true
  validates :price,              presence: true
  validates :user,               presence: true

  has_one_attached :image
  
  # belongs_to :user
  # has_one :buy
end
    