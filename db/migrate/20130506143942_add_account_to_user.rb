# -*- encoding : utf-8 -*-
class AddAccountToUser < ActiveRecord::Migration
  def change
    add_column :users, :account, :string
  end
end
