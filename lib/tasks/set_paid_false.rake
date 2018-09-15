namespace :jobs do
  task :set_paid_false => :environment do
    require 'data_fixers/set_paid_false'
    DataFixers::SetPaidFalse.new.set
  end
end
