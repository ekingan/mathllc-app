class CreatePreparers < ActiveRecord::Migration[5.1]
  def change
    create_table :preparers do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.date :date_of_birth
      t.string :license_number
      t.string :job_title

      t.timestamps
    end
  end
end
