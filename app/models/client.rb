class Client < ApplicationRecord
	has_many :jobs
  has_many :preparers, through: :jobs
  enum entity_type: [:individual, :partnership, :s_corp, :c_corp, :non_profit, :trust, :estate]
  enum filing_status: [:single, :mfj, :mfs, :hoh, :widow]
  validates_presence_of :last_name, :first_name
end
