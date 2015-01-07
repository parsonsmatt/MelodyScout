class RemoveNullFromBoolean < ActiveRecord::Migration
  def change
    change_column :users, :admin, :boolean, null: false, default: false
    change_column :release_dates, :released, :boolean, null: false, default: false
  end
end
