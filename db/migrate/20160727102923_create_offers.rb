class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :date_begin
      t.string :date_end
      t.text :description
      t.string :prof_area
      t.string :type_contract
      t.string :salary
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :offers, [:user_id, :created_at]
  end
end
