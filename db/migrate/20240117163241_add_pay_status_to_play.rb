class AddPayStatusToPlay < ActiveRecord::Migration[7.0]
  def change
    add_column :plays, :paid, :boolean, default: false
  end
end
