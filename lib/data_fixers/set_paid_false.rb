module DataFixers
  class SetPaidFalse

    def initialize
      @jobs = Job.all
    end

    def set
      @jobs.find_each do |job|
        job.update(paid_in_full: false) if job.payments.sum(&:amount) == 0
      end
    end
  end
end
