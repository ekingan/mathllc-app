class AddEfileFinalCheckToJob < ActiveRecord::Migration[5.1]
  def up
    add_column :jobs, :final_efile_check, :boolean, :default => false
  end

  def down
    remove_column :jobs, :final_efile_check
  end
end
