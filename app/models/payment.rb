class Payment < ApplicationRecord
  belongs_to :job, touch: true
  enum payment_type: [:check, :cash, :square, :paypal, :qbo, :stripe, :trade, :other]
  validates_presence_of :amount, numericality: true
  validate :payment_amount
  after_validation :update_paid_in_full

  scope :created_in, ->(year) { where('extract(year from created_at) = ?', year ) }

  def sum_of_payments
    payments = job.payments.sum(&:amount)
  end

  def total_due
    job.bill
  end

  def payment_amount
    if partial_payment
      errors.add(:payment, "This payment must not exceed $#{job.bill - sum_of_payments}") unless (sum_of_payments + amount <= total_due)
    else
      errors.add(:payment, "This payment must equal $#{total_due-sum_of_payments}. If this is a partial payment, please check the partial payment box") unless (amount == total_due)
    end
  end

  def update_paid_in_full
    job = Job.find_by_id(self.job_id)
    job.update_attributes(paid_in_full: true) if sum_of_payments + amount == total_due
  end

end
