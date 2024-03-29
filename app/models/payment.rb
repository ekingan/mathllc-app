class Payment < ApplicationRecord
  belongs_to :job, touch: true
  enum payment_type: [:check, :cash, :square, :paypal, :qbo, :stripe, :trade, :other]
  validate :amount_valid
  validate :payment_amount
  after_validation :update_paid_in_full

  after_destroy :set_fully_paid_false

  scope :created_in, ->(year) { where('extract(year from created_at) = ?', year ) }

  attr_accessor :job

  def job
    @job ||= Job.find_by_id(self.job_id)
  end

  def sum_of_payments
    job.payments.sum(&:amount)
  end

  def total_due
    job.bill
  end

  def amount_valid
    errors.add(:amount, 'must be more than 1') if amount.nil? || amount < 1
  end

  def payment_amount
    if partial_payment
      errors.add(:payment, "must not exceed $#{job.bill - sum_of_payments}") unless (sum_of_payments + amount <= total_due)
    else
      errors.add(:payment, "must equal $#{total_due-sum_of_payments}. If this is a partial payment, please check the partial payment box") unless (amount == total_due)
    end
  end

  def fully_paid?
    sum_of_payments + amount == total_due
  end

  def update_paid_in_full
    job.update(paid_in_full: fully_paid?) if amount.present?
  end

  def set_fully_paid_false
    job.update(paid_in_full: false) 
  end
end
