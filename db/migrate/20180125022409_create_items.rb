class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :item_image
      t.integer :item_cost
      t.text :item_detail


      t.timestamps
    end
  end
end
