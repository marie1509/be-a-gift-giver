class AddDidbuyCountToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :didbuy_count, :integer
  end
end
