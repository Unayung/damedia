# -*- encoding : utf-8 -*-
module UsersHelper

  def render_user_status(user)
    user.account_status
  end
end
