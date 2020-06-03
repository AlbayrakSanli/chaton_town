class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

<<<<<<< HEAD
  def in_cart
    self.items
  end

  def total
    self.join_cart_items.map{ |item| item.total }.sum
  end
=======
  def add_product(item)
    itemL = line_items.find_by(item: item)

    if itemL
      itemL.quantity += 1
    else
      itemL = line_items.new(item: item)
    end
>>>>>>> developpement

  def is_in_cart?(id)
    self.join_cart_items.find_by(cart_id: self.id, item_id: id)
  end
end
