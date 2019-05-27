class CreateNgos < ActiveRecord::Migration[5.2]
  def change
    create_table :ngos do |t|
      t.string :name
      t.text :description
      t.string :impact

      t.timestamps
    end
  end
end
