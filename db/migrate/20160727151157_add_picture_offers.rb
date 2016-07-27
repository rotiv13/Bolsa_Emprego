class AddPictureOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :picture, :string
  end
end
