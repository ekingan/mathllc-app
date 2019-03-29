class AddPositionToTodos < ActiveRecord::Migration[5.2]
  def up
    add_column :todos, :position, :integer, default: 1
  end

  def down
    remove_column :todos, :position
  end
end
