class AddPriceToPlays < ActiveRecord::Migration[7.0]
  def change
    add_column :plays, :price, :float
  end
end
