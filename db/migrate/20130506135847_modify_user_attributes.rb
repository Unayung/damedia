# -*- encoding : utf-8 -*-
class ModifyUserAttributes < ActiveRecord::Migration
  def change
    remove_column :users, :fb_id
    add_column :users, :title, :string
    add_column :users, :enabled, :boolean
  end
end
