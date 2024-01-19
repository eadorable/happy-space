class CreateRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.float :price

      t.timestamps
    end
  end
end
