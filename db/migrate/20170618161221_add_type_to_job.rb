class AddTypeToJob < ActiveRecord::Migration[5.1]
  def up
    add_column :jobs, :type, :integer
  end

  def down
    remove_column :jobs, :type
  end

end
