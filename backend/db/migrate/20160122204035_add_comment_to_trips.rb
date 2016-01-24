class AddCommentToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :comment, :text
  end
end
