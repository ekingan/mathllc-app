class AddDiscontinueToClient < ActiveRecord::Migration[5.1]
  def up
    add_column :clients, :discontinue, :boolean, :default => false
  end

  def down
    remove_column :clients, :discontinue
  end
end
