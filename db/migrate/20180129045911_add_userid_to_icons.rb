class AddUseridToIcons < ActiveRecord::Migration[5.1]
  def change
    add_column :icons, :user_id, :integer
  end
end
