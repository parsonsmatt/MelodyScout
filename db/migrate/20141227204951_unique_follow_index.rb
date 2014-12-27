class UniqueFollowIndex < ActiveRecord::Migration
  def change
    add_index :follows, [:artist_id,:user_id], unique: true
  end
end
