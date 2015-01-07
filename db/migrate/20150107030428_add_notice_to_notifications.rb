class AddNoticeToNotifications < ActiveRecord::Migration
  def change
    add_reference :notifications, :notice, index: true
    add_foreign_key :notifications, :notices
  end
end
