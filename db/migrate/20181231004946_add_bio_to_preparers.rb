class AddBioToPreparers < ActiveRecord::Migration[5.2]
  def up
    add_column :preparers, :bio, :text
  end

  def down
    remove_column :preparers, :bio
  end
end
