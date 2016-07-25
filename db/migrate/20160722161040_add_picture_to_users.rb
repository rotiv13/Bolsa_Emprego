class AddPictureToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :picture, :string, default: 'https://robohash.org/sitsequiquia.png?size=300x300'
  end
end
