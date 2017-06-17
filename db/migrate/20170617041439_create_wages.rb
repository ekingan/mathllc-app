class CreateWages < ActiveRecord::Migration[5.1]
  def change
    create_table :wages do |t|
      t.decimal :Amount
      t.references :preparer, foreign_key: true

      t.timestamps
    end
  end
end
