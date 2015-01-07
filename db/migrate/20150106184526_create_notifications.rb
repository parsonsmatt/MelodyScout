class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :release, index: true
      t.references :release_date, index: true

      t.timestamps null: false
    end
    add_foreign_key :notifications, :releases
    add_foreign_key :notifications, :release_dates
  end
end
