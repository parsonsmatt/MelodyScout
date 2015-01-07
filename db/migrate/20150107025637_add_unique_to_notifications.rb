class AddUniqueToNotifications < ActiveRecord::Migration
  def change
    add_index :notifications, [:release_date_id, :release_id], unique: true
  end
end
