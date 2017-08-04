class ReceiptMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt(user, cart, order)
    if user != nil
      @user = user
      @cart = cart
      mail(to: @user.email, subject: "Your order \##{order.id}")
    end
  end
end
