class AddControlNumberToParents < ActiveRecord::Migration[7.0]
  def change
    add_column :parents, :control_number, :string
  end
end
