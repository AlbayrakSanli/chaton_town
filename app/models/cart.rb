class Cart < ApplicationRecord
  has_one :user
  has_many :join_cart_items
  has_many :items, through: :join_cart_items

  def add_product(item)
    itemL = join_cart_items.find_by(item: item)

    if itemL
      itemL.quantity += 1
    else
      itemL = join_cart_items.new(item: item)
    end

    itemL
  end
end
