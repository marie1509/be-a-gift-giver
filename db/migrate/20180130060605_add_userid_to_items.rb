class AddUseridToItems < ActiveRecord::Migration[5.1]
  def change
    # 基本形: user_idという名前で users.id への外部キー制約をはる
    add_reference :items, :user, foreign_key: true
  end
end
