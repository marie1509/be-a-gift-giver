class AddWillbuyCountToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :willbuy_count, :integer
  end
end
