class ReceiptMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt(user)
    @user = user
    @url = 'localhost:3000'
    mail(to: @user.email, subject: "Your order has been received")
  end
end
