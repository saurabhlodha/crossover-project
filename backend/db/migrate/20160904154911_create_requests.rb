class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :request_id
      t.string :description
      t.integer :status, default: 0
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
