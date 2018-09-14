namespace :JOBS do
  task :set_paid => :environment do
    require 'data_fixers/set_paid_on_jobs'
    DataFixers::ImportPartnerships.set
  end
end