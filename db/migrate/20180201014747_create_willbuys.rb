class CreateWillbuys < ActiveRecord::Migration[5.1]
  def change
    create_table :willbuys do |t|
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
  end
end
