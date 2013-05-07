# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :login_required
  before_filter :find_user, :only => [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    
  end

  def new
    @user = User.new    
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_path, :notice => "新增使用者成功"
    else
      redirect_to :back, :notice => "新增使用者失敗，請檢查欄位"
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  protected

  def find_user
    @user = User.find(params[:id])
  end

end
