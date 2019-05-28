class AddPhotoToNgos < ActiveRecord::Migration[5.2]
  def change
    add_column :ngos, :photo, :string
  end
end
