class AddActiveOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :active, :boolean, default: false
  end
end
