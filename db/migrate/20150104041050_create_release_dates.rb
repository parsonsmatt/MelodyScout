class CreateReleaseDates < ActiveRecord::Migration
  def change
    create_table :release_dates do |t|
      t.date :date, index: true
      t.references :release, index: true
      t.string :country

      t.timestamps null: false
    end
    add_foreign_key :release_dates, :releases
  end
end
