class AddInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address, :text
    add_column :users, :postal_code, :string
    add_column :users, :locality, :string
    add_column :users, :phone, :string
    add_column :users, :cellphone, :string
    add_column :users, :page, :string
    add_column :users, :birth_date, :date
    add_column :users, :idnum, :string
    add_column :users, :prof_area, :string
    add_column :users, :presentation, :text
    add_column :users, :skill_level, :string
    add_column :users, :skills, :text
    add_column :users, :prof_situation, :string
    add_column :users, :prof_experience, :text

  end
end
