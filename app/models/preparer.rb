class Preparer < ApplicationRecord
	has_many :clients
	has_many :payments
	has_many :jobs
  validates_presence_of :first_name, :last_name
end
