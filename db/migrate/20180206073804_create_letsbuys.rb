class CreateLetsbuys < ActiveRecord::Migration[5.1]
  def change
    create_table :letsbuys do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :pay_amount

      t.timestamps
    end
  end
end
