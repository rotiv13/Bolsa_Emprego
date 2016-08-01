class CreateOfferRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :offer_relationships do |t|
      t.integer :cand_id
      t.integer :of_cand_id

      t.timestamps
    end
    add_index :offer_relationships, :cand_id
    add_index :offer_relationships, :of_cand_id
    add_index :offer_relationships, [:cand_id, :of_cand_id], unique: true

  end
end
