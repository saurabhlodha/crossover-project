class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :destination
      t.datetime :start_date
      t.datetime :enddate

      t.timestamps null: false
    end
  end
end
