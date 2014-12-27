class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :user, index: true
      t.references :artist, index: true

      t.timestamps null: false
    end
    add_foreign_key :follows, :users
    add_foreign_key :follows, :artists
  end
end
