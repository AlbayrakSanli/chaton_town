class UserMailer < ApplicationMailer
  default from: 'chaton-sauvage@yopmail.com'

  def order_confirmation(order)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @order = order
    @user = order.user
    @items = order.items
    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Confirmation de votre commande !')
  end
end
