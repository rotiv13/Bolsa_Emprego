class AddActiveDestaqueToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :destaque, :boolean
    add_column :news, :active, :boolean
  end
end
