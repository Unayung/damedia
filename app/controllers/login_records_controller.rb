# -*- encoding : utf-8 -*-
class LoginRecordsController < ApplicationController
  before_filter :find_user

  def index
    @records = @user.login_records.paginate(:page => params[:page], :per_page => 10)
  end

  protected

  def find_user
    @user = User.find(params[:user_id])
  end
end
