# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :login_required
  before_filter :find_user, :only => [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to edit_user_path(@user), :notice => "OK"
    else
      render :action => "edit"
    end
  end

  def destroy
    
  end

  protected

  def find_user
    @user = User.find(params[:id])
  end

end
