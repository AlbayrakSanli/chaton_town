class UserMailer < ApplicationMailer
  default from: 'chaton-sauvage@yopmail.com'

  def order_confirmation(order)
    @order = order
    @user = order.user
    @items = order.items
    mail(to: @user.email, subject: 'Confirmation de votre commande !')
  end
end
