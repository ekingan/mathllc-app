class Payment < ApplicationRecord
  belongs_to :job
  enum payment_type: [:check, :cash, :square, :paypal, :qbo, :stripe, :trade, :other]
  validates_presence_of :amount
  validates :amount, numericality: {
    equal_to: ->(payment) { payment.job.bill }
  }
end
