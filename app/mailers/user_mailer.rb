class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

def welcome_email(user)
  @user = user
  @url  = 'http://localhost:3000/users'
  mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  puts @user
end

def receipt_email(order, user)
  @order = order
  @user = user
  @url  = 'http://localhost:3000/users'
  mail(to: @order.email, subject: "Order: ##{@order.id} successfuly completed")
end

end
