class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :test_answers, dependent: :destroy
  has_one_attached :card_front # 証明書表面
  has_one_attached :card_back # 証明書裏面
end
