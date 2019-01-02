class Preparer < ApplicationRecord
	has_many :clients, through: :jobs
	has_many :jobs
	has_many :payments, through: :jobs
	has_many :wages
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  validates_presence_of :first_name, :last_name

	def name
		first_name + " " + last_name
	end

	def total_payments_by_year(year)
		jobs.map{|job| job.payments.created_in(year).map{|pay| pay.amount.to_f}.sum}.sum
	end

	def total_wages_by_year(year)
		wages.created_in(year).map(&:amount).sum
	end

	def balance(year)
		total_payments_by_year(year)/2 - wages.created_in(year).map(&:amount).sum
	end

end
