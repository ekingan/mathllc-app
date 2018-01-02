class AddPartialPaymentToPayments < ActiveRecord::Migration[5.1]
  def up
    add_column :payments, :partial_payment, :boolean, :default => false
  end

  def down
    remove_column :payments, :partial_payment
  end
end
