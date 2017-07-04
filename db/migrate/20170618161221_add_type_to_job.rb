class AddTypeToJob < ActiveRecord::Migration[5.1]
  def up
    add_column :jobs, :job, :integer
  end

  def down
    remove_column :jobs, :job
  end

end
