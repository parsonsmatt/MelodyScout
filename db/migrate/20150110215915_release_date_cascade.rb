class ReleaseDateCascade < ActiveRecord::Migration
  def change
    remove_foreign_key :notifications, :release_dates
    add_foreign_key :notifications, :release_dates, on_delete: :cascade
  end
end
