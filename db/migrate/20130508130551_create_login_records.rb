class CreateLoginRecords < ActiveRecord::Migration
  def change
    create_table :login_records do |t|
      t.string :ip_address
      t.string :type
      t.timestamps
    end
  end
end
