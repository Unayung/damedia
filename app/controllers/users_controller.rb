# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :login_required
  before_filter :find_user, :only => [:show, :edit, :update, :change_password, :edit_password]

  def index
    @users = User.paginate(:page => params[:page], :per_page => 10)
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
      redirect_to edit_user_path(@user), :notice => "修改資料成功"
    else
      render :action => "edit", :notice => "修改資料失敗"
    end
  end

  def edit_password
    
  end

  def change_password
    if params[:user][:password] != params[:user][:password_confirmation]
      flash[:error] = "新密碼不相符, 請確定兩次輸入相同"
      redirect_to edit_password_user_path(@user)
    elsif params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      flash[:notice] = "密碼未更改"
      redirect_to edit_password_user_path(@user)
    else
      if @user.update_attributes(params[:user])
        # Sign in the user by passing validation in case his password changed
        sign_in @user, :bypass => true
        redirect_to edit_user_path(@user), :notice => "修改密碼成功"
      else
        render "edit_password", :notice => "修改密碼失敗"
      end
    end

  end

  def destroy
    
  end

  protected

  def find_user
    @user = User.find(params[:id])
  end

end
