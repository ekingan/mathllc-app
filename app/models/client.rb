class Client < ApplicationRecord
	has_many :jobs
  has_many :preparers, through: :jobs
	has_one :primary_preparer
  enum entity_type: [:INDIVIDUAL, :PARTNERSHIP, :S_CORP, :C_CORP, :NON_PROFIT, :TRUST, :ESTATE]
  enum filing_status: [:SINGLE, :MFJ, :MFS, :HOH, :WIDOW]
  validates_presence_of :last_name, :email
	validates :tax_id, length: { is: 4, :allow_nil => true}

	def name
		"#{last_name} #{first_name} // #{company}"
	end

end
