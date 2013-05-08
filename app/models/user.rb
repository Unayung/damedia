# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  extend OmniauthCallbacks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :authentication_keys => [:account]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :account, :name, :email, :title, :enabled, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :login_records

  def admin?
    Setting.admin_emails.include?(email)
  end

  def after_database_authentication
    record = self.login_records.new
    record.ip_address = self.current_sign_in_ip
    record.save
  end

  def account_status
    if enabled
      "啟用"
    else
      "停用"
    end
  end
end
