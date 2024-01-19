class AddRateReferenceToPlay < ActiveRecord::Migration[7.0]
  def change
    add_reference :plays, :rate, null: false, foreign_key: true
  end
end
