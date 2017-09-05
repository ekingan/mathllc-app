class AddUserRefToPreparer < ActiveRecord::Migration[5.1]
  def change
    add_reference :preparers, :user, foreign_key: true
  end
end
