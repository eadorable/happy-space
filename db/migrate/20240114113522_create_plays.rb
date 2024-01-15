class CreatePlays < ActiveRecord::Migration[7.0]
  def change
    create_table :plays do |t|
      t.references :parent, null: false, foreign_key: true
      t.integer :number_of_kids
      t.integer :number_of_hours
      t.timestamp :start_time
      t.timestamp :end_time
      t.string :control_number
      t.boolean :consent_agreed
      t.boolean :open_time
      t.float :price

      t.timestamps
    end
  end
end
