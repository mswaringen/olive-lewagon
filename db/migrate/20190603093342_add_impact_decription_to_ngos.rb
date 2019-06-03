class AddImpactDecriptionToNgos < ActiveRecord::Migration[5.2]
  def change
    add_column :ngos, :impact_description, :text
  end
end
