class AddPictureToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :picture, :string
  end
end
