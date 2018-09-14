class Payment < ApplicationRecord
  belongs_to :job
  enum payment_type: [:check, :cash, :square, :paypal, :qbo, :stripe, :trade, :other]
  validates_presence_of :amount, numericality: true
  validate :payment_amount

  def payment_amount
    payments = job.payments.sum(&:amount)
    total_due = job.bill
    if partial_payment
      errors.add(:payment, "This payment must not exceed $#{job.bill - payments}") unless (payments + amount <= total_due)
    else
      errors.add(:payment, "This payment must equal $#{total_due}. If this is a partial payment, please check the partial payment box") unless (amount == total_due)
    end
  end

end
