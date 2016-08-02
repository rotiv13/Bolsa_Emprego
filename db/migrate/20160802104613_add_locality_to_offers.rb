class AddLocalityToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :locality, :string
  end
end
