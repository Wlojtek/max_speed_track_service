class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :slug
      t.timestamps null: false
    end
  end
end
