class RemoveReleasedFromRelease < ActiveRecord::Migration
  def change
    remove_column :releases, :released
  end
end
