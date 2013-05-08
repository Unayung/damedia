# -*- encoding : utf-8 -*-
module UsersHelper

  def render_user_serial_number(index)
    if params[:page].to_i-1 >0
      return index+1+(params[:page].to_i-1)*10
    else
      index+1
    end
  end
    
end
