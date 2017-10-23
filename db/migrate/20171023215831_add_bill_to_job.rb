class AddBillToJob < ActiveRecord::Migration[5.1]
  def up
    add_column :jobs, :bill, :float, :default => 0.00
  end

  def down
    remove_column :jobs, :bill
  end
end
