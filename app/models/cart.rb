class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(item)
    itemL = line_items.find_by(item: item)

    if itemL
      itemL.quantity += 1
    else
      itemL = line_items.new(item: item)
    end

    itemL
  end
end
