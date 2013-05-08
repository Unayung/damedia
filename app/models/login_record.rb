class LoginRecord < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user

  def login_time
    self.created_at.to_s(:long)
  end
end
