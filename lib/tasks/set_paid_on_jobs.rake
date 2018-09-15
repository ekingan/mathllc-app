namespace :jobs do
  task :set_paid => :environment do
    require 'data_fixers/set_paid_on_jobs'
    DataFixers::SetPaidOnJobs.new.set
  end
end
