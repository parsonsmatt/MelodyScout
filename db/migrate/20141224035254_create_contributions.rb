class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.references :artist_id, index: true
      t.references :release_id, index: true

      t.timestamps null: false
    end
    add_foreign_key :contributions, :artist_ids
    add_foreign_key :contributions, :release_ids
  end
end
