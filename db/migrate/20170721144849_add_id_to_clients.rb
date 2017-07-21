class AddIdToClients < ActiveRecord::Migration[5.1]
  def up
    add_column :clients, :tax_id, :integer
  end

  def down
    remove_column :clients, :tax_id
  end
end
