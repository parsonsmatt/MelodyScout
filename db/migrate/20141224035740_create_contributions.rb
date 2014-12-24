class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.references :artist, index: true
      t.references :release, index: true

      t.timestamps null: false
    end
    add_foreign_key :contributions, :artists
    add_foreign_key :contributions, :releases
  end
end
