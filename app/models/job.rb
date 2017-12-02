class Job < ApplicationRecord
  belongs_to :client
  belongs_to :preparer
  has_one :payment
  enum fed_form: [:Individual_1040, :S_Corp_1120S, :Partnership_1065, :C_Corp_1120, :Non_Profit_990, :Trust_1041, :Estate_706, :Amendment, :other]
  enum status: [:commited, :todo, :in_progress, :need_info, :need_signatures, :ready, :filed, :done, :extended, :accepted]
  enum job_type: [:bookkeeping, :consulting, :referral, :teaching]

  scope :unpaid, -> { joins('left outer join payments on payments.job_id = jobs.id').where('payments.job_id IS null')}

  scope :paid, -> { joins('left outer join payments on payments.job_id = jobs.id').where('payments.job_id IS NOT null')}

  def to_param
    "#{id} #{client.last_name}".parameterize
  end

  def file!
    self.update_attribute(:status, :filed)
    self.update_attribute(:filed, Time.now)
  end

  def fed_accepted!
    self.update_attribute(:ack_fed, Time.now)
    set_to_accepted_status
  end

  def state_accepted!
    self.update_attribute(:ack_primary_state, Time.now)
    set_to_accepted_status
  end

  def set_to_accepted_status
    if self.ack_fed && self.ack_primary_state
      self.update_attribute(status, :accepted)
    end
  end
end
