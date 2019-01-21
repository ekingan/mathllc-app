class AddImageUrlToPreparers < ActiveRecord::Migration[5.2]
  def up
    add_column :preparers, :image_url, :string
  end

  def down
    remove_column :preparers, :image_url
  end
end
