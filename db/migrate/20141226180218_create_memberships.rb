class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :group_id
      t.integer :member_id

      t.timestamps null: false
    end
    add_index :memberships, :group_id
    add_index :memberships, :member_id
    add_index :memberships, [:group_id, :member_id], unique: true
  end
end
