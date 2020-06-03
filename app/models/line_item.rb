<<<<<<< HEAD:app/models/join_cart_item.rb
class JoinCartItem < ApplicationRecord
  before_create :already_exist?
  after_create :null

=======
class LineItem < ApplicationRecord
>>>>>>> developpement:app/models/line_item.rb
  belongs_to :cart
  belongs_to :item

  def total
    self.item.price * self.quantity
  end

  private

  def already_exist?
    find = JoinCartItem.find_by(cart_id: self.cart_id, item_id: self.item_id)

    if find != nil
      find.destroy
    end
  end

  def null
    if self.quantity == nil
      self.update(quantity: 1)
    end
  end
end
