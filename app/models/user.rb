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
  attr_accessible :account, :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def admin?
    Setting.admin_emails.include?(email)
  end

end
