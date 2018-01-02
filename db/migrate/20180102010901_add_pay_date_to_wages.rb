class AddPayDateToWages < ActiveRecord::Migration[5.1]
  def up
    add_column :wages, :pay_date, :date
  end

  def down
    remove_column :wages, :pay_date
  end
end
