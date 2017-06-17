class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.integer :payment_type
      t.integer :check_number
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
