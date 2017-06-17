class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.date :date_of_birth
      t.string :email
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :occupation
      t.integer :entity_type
      t.date :tax_year_ends
      t.integer :filing_status
      t.integer :number_of_dependents
      t.string :spouse_first_name
      t.string :spouse_last_name
      t.date :spouse_date_of_birth
      t.string :spouse_phone
      t.string :spouse_email
      t.string :spouse_occupation
      t.text :notes

      t.timestamps
    end
  end
end
