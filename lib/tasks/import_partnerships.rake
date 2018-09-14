namespace :clients do
  task :import_partnerships => :environment do
    require 'data_fixers/import_partnerships'
		DataFixers::ImportPartnerships.import!
	end
end
