class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :number_of_date

  with_options presence: true do
    validates :goods
    validates :explain
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
    validates :user
    validates :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :situation_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :number_of_date_id
  end

  has_one_attached :image

  belongs_to :user
  # has_one :buy
end
