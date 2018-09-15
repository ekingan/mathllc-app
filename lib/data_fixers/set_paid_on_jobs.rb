module DataFixers
  class SetPaidOnJobs

    def initialize
      @jobs = Job.all
    end

    def set
      @jobs.find_each do |job|
        payments = job.payments.sum(&:amount)
        total = job.bill
        job.update_attributes(paid_in_full: true) if payments == total
      end
    end
  end
end
