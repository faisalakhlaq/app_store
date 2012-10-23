class UserMailer < ActionMailer::Base
  default from: 'faisal.akhlaq@devbatch.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://devbatch.com/login'
    mail(to: user.email, subject: 'Welcome to Devbatch App Store')
  end
end