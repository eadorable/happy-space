class AddConsentAgreedToParents < ActiveRecord::Migration[7.0]
  def change
    add_column :parents, :consent_agreed, :boolean
  end
end
