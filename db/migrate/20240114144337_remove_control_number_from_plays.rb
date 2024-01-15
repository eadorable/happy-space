class RemoveControlNumberFromPlays < ActiveRecord::Migration[7.0]
  def change
    remove_column :plays, :control_number, :string
  end
end
