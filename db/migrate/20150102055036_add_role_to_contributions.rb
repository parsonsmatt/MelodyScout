class AddRoleToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :role, :string
  end
end
