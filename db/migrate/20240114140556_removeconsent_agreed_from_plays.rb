class RemoveconsentAgreedFromPlays < ActiveRecord::Migration[7.0]
  def change
    remove_column :plays, :consent_agreed, :boolean
  end
end
