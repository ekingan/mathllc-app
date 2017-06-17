class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :fed_form
      t.string :primary_state
      t.string :second_state
      t.string :third_state
      t.boolean :tmse
      t.boolean :portland
      t.integer :status
      t.boolean :printed
      t.boolean :scanned
      t.boolean :uploaded
      t.date :filed
      t.date :ack_fed
      t.date :ack_primary_state
      t.date :ack_second_state
      t.date :ack_third_state
      t.date :due_date
      t.string :rejected
      t.text :notes
      t.references :client, foreign_key: true
      t.references :preparer, foreign_key: true

      t.timestamps
    end
  end
end
