class AddYearToJob < ActiveRecord::Migration[5.2]
  def up
    add_column :jobs, :year, :integer
  end

  def down
    remove_column :jobs, :year
  end
end
