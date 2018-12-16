class Client < ApplicationRecord
	has_many :jobs
  has_many :preparers, through: :jobs
	has_one :primary_preparer
  enum entity_type: [:INDIVIDUAL, :PARTNERSHIP, :S_CORP, :C_CORP, :NON_PROFIT, :TRUST, :ESTATE]
  enum filing_status: [:SINGLE, :MFJ, :MFS, :HOH, :WIDOW]
  validates_presence_of :last_name, :email
	validates :tax_id, length: { is: 4, :allow_nil => true}
  validates_uniqueness_of :last_name, :scope => :first_name

  scope :active, -> { where.not(discontinue: :true) }

	def name
		"#{last_name} #{first_name} // #{company}"
	end

  def last_name=(s)
    write_attribute(:last_name, s.to_s.upcase)
  end

  def first_name=(s)
    write_attribute(:first_name, s.to_s.upcase)
  end

  def company=(s)
    write_attribute(:company, s.to_s.upcase)
  end
end
