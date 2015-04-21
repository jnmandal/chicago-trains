class AddDataCorruptFlagToTrain < ActiveRecord::Migration
  def change
    add_column :trains, :flag, :boolean, default: false
    add_column :trains, :flag_info, :string
  end
end
