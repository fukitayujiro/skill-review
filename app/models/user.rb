class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contents
  has_many :messages

  with_options presence: true do
    validates :name
  end

  with_options presence: true, uniqueness: true do
    validates :email
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  with_options presence: true, confirmation: true, length: { minimum: 6 },format: { with: PASSWORD_REGEX } do
    validates :password
  end

end
