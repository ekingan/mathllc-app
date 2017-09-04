class Preparer < ApplicationRecord
	has_many :clients, through: :jobs
	has_many :payments, through: :jobs
	has_many :jobs
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  validates_presence_of :first_name, :last_name

	def name
		first_name + " " + last_name
	end
end
