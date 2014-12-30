class AddIndividualToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :individual, :boolean
  end
end
