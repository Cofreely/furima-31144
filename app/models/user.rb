class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_date, presence: true
  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-zA-Z])[a-zA-Z\d]+\z/, message: 'Password include both letters and numbers' }
  end
end
