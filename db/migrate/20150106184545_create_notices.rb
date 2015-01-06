class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.references :user, index: true
      t.references :notification, index: true

      t.timestamps null: false
    end
    add_foreign_key :notices, :users
    add_foreign_key :notices, :notifications
  end
end
