class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :number_of_date


  validates :goods,              presence: true
  validates :explain,            presence: true
  validates :category_id ,       presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :situation_id,       presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :prefecture_id,      presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :number_of_date_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :price,              presence: true
  validates :user,               presence: true

  has_one_attached :image

 
  # belongs_to :user
  # has_one :buy
end
    