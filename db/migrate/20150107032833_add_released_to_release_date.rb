class AddReleasedToReleaseDate < ActiveRecord::Migration
  def change
    add_column :release_dates, :released, :boolean
  end
end
