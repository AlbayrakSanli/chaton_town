class AdminMailer < ApplicationMailer
  default from: 'chaton-sauvage@yopmail.com'

  def order_notification(order)
    @order = order
    @items = order.items
    mail(to: "chaton-sauvage@yopmail.com", subject: "Nouvelle commande !")
  end
end