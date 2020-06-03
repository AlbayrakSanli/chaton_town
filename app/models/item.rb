class Item < ApplicationRecord
  has_many :line_items, dependent: :nullify

  has_many :join_table_order_items
  has_many :orders, through: :join_table_order_items

  has_one_attached :picture
end
