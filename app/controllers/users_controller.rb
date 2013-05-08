# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :login_required
  before_filter :find_user, :only => [:show, :edit, :update, :change_password, :edit_password]

  def index
    @users = User.all
  end

  def show
    
  end

  def edit
    
  end

  def update

    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
    end

    if @user.update_attributes(params[:user])
      redirect_to edit_user_path(@user), :notice => "修改成功"
    else
      render :action => "edit", :notice => "修改失敗"
    end
  end

  def edit_password
    
  end

  def change_password
    if @user.update_with_password(params[:user])
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render :action => "edit", :notice => "修改失敗"
    end
  end

  def destroy
    
  end

  protected

  def find_user
    @user = User.find(params[:id])
  end

end
