class Payment < ApplicationRecord
  belongs_to :job
  enum payment_type: [:check, :cash, :square, :paypal, :stripe, :trade, :other]
  validates_presence_of :amount
end
