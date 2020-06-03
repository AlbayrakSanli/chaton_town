class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :user_cart

  has_one :cart, dependent: :destroy

  has_many :orders
  has_many :users, through: :comments


  private

  def user_cart
    Cart.create(user_id: self.id)
  end
end
