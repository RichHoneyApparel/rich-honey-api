class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :business
  has_one :address

  validates :auth_token, uniqueness: true

  before_create :generate_authentication_token!
  after_create :send_admin_mail

  accepts_nested_attributes_for :business, :address

  def send_admin_mail
    NewUserMailer.send_new_user_message(self).deliver
  end

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
