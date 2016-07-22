class AddCurriculumToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :curriculum, :string
  end
end
