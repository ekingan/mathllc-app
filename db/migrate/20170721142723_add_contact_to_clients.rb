class AddContactToClients < ActiveRecord::Migration[5.1]
  def up
    add_reference :clients, :primary_preparer, foreign_key: { to_table: :preparers }
  end

  def down
    remove_column :clients, :primary_contact
  end
end
