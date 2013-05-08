class AddUserIdToLoginRecord < ActiveRecord::Migration
  def change
    add_column :login_records, :user_id, :integer
  end
end
