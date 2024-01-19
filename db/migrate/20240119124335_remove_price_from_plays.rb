class RemovePriceFromPlays < ActiveRecord::Migration[7.0]
  def change
    remove_column :plays, :price, :float
  end
end
