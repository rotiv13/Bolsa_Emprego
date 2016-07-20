class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :email
      t.string :name
      t.text :address
      t.string :postal_code
      t.string :locality
      t.integer :phone
      t.integer :cellphone
      t.string :page
      t.date :date_of_birth
      t.integer :ccid
      t.string :profession_area
      t.text :presentation
      t.string :habilitations
      t.text :skills
      t.string :professional_situ
      t.text :professional_exp
      t.string :password_digest
      t.timestamps
    end
    add_index :candidates, :email, unique: true
  end
end
