class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :surface_type
      t.timestamps null: false
    end
  end
end
