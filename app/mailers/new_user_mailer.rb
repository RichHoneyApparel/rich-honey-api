class NewUserMailer < ActionMailer::Base
  default from: "info@richhoney.us"

  def send_enabled_message(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Rich Honey Apparel!")
  end

  def send_new_user_message(user)
    @user = user
    mail(:to => 'sales@richhoney.us', :subject => "New User created please review and enable.")
  end
end
