class ReceiptMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt(user, cart, order)
    @user = user
    @cart = cart
    # @order = order
    # @url = 'localhost:3000'
    mail(to: @user.email, subject: "Your order \##{order.id}")
  end
end
