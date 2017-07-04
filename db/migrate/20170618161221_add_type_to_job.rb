class AddTypeToJob < ActiveRecord::Migration[5.1]
  def up
    add_column :jobs, :job_type, :integer
  end

  def down
    remove_column :jobs, :job_type
  end

end
