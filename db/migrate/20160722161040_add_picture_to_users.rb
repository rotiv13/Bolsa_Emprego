class AddPictureToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :picture, :string, default: 'https://rohttp://www.iconsfind.com/wp-content/uploads/2015/08/20150831_55e46b18e2a80.png'
  end
end
