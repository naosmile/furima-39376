class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,                   presence: true
  validates :password,                   format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数字で入力して下さい' }
  validates :last_name_full_width,       presence: true,
                                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角ひらがな、全角カタカナ、漢字で入力して下さい' }
  validates :first_name_full_width,      presence: true,
                                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角ひらがな、全角カタカナ、漢字で入力して下さい' }
  validates :last_name_kana_full_width,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい' }
  validates :first_name_kana_full_width, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい' }
  validates :date_of_birth,              presence: true

  # has_many :items
  # has_many :buys
end
