class AddEntitieToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :entitie, :boolean
  end
end
