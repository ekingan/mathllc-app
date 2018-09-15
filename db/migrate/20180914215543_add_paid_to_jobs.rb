class AddPaidToJobs < ActiveRecord::Migration[5.1]
  def up
    add_column :jobs, :paid_in_full, :boolean, null: false, default: false
  end

  def down
    remove_column :jobs, :paid_in_full
  end
end
