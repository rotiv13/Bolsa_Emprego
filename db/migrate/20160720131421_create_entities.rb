class CreateEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :entities do |t|
      t.string :email
      t.string :name
      t.text :address
      t.string :postal_code
      t.string :locality
      t.integer :phone
      t.integer :cellphone
      t.string :page
      t.integer :nif
      t.string :professional_acti
      t.text :presentation
      t.string :password_digest
      t.timestamps
    end
    add_index :entities, :email, unique: true
  end
end
