class WelcomeMailer < ApplicationMailer
  default from: "wishrbox@gmail.com"
  def welcome_email(user)
    @user = user
    mail(from: "wishrbox@gmail.com", to: user.email, subject: "Hola #{user.name}, bienvenido a WishrBox")
  end
end
