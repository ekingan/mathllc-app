class Payment < ApplicationRecord
  belongs_to :job
  enum payment_type: [:check, :cash, :square, :paypal, :qbo, :stripe, :trade, :other]
  validates_presence_of :amount, numericality: true
  validate :payment_amount, :partial_payment_amount

  def payment_amount
    errors.add(:amount, "The payment amount must equal the bill amount #{job.bill}") unless amount = job.bill
  end

  def partial_payment_amount
    return true unless partial_payment
    payments = job.payments.sum(&:amount)
    errors.add(:amount, "The payment amount must be less than or equal to the bill amount") unless (payments + amount <= job.bill)
  end

end
