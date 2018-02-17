class AddDefaultWillbuyCountToItem < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :willbuy_count, :integer, :default => 0
  end
end
