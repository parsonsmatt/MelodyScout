class AddUniqueToContributions < ActiveRecord::Migration
  def change
    add_index :contributions, [:artist_id, :release_id], unique: true
  end
end
