class Order < ApplicationRecord
  after_create :order_notification

  belongs_to :user
  has_many :join_table_order_items
  has_many :items, through: :join_table_order_items

  def order_notification
    AdminMailer.order_notification(self).deliver_now
  end

end
