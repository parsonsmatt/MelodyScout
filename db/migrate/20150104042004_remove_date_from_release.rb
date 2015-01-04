class RemoveDateFromRelease < ActiveRecord::Migration
  def change
    remove_column :releases, :date
  end
end
