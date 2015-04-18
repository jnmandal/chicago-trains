class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :line
      t.string :route
      t.string :run
      t.string :operator

      t.timestamps null: false
    end
  end
end
