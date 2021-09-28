class Job < ApplicationRecord
  belongs_to :client
  belongs_to :preparer
  has_many :payments
  enum fed_form: [:Individual_1040, :S_Corp_1120S, :Partnership_1065, :C_Corp_1120, :Non_Profit_990, :Trust_1041, :Estate_706, :Amendment, :other]
  enum status: [:commited, :todo, :in_progress, :need_info, :need_signatures, :ready, :filed, :done, :extended, :accepted, :rejected, :review]
  enum job_type: [:bookkeeping, :consulting, :referral, :teaching]
  validates_presence_of :status, :fed_form

  scope :unpaid, -> { where(paid_in_full: false) }

  scope :paid, -> { joins('left outer join payments on payments.job_id = jobs.id').where('payments.job_id IS NOT null')}

  scope :not_done, -> { where.not(status: :done) }

  scope :not_scanned, -> { where(scanned: false).where(job_type: nil).where(status: [:todo, :in_progress, :need_info, :need_signatures, :ready, :filed, :review, :accepted]) }

  scope :not_printed_or_uploaded, -> { where('printed=? AND uploaded=?', false, false).where(job_type: nil).where(status: [:todo, :in_progress, :need_info, :need_signatures, :ready, :filed, :review, :accepted]) }

  scope :unbilled, -> { where('bill=?', 0.0) }

  scope :billed, -> { where('bill!=?', 0.0) }

  def to_param
    "#{id} #{client.last_name} #{year}".parameterize
  end

  def file!
    self.update_attribute(:status, :filed) unless self.status == 'extended'
    self.update_attribute(:filed, Time.now)
  end

  def fed_accepted!
    self.update_attribute(:ack_fed, Time.now)
    set_to_accepted_status unless self.status == 'extended'
  end

  def state_accepted!
    self.update_attribute(:ack_primary_state, Time.now)
    if self.ack_fed
      set_to_accepted_status unless self.status == 'extended'
    end
  end

  def set_to_accepted_status
    self.update_attribute(:status, :accepted)
  end

  def amount_due
    bill - payments.sum(&:amount)
  end

end
