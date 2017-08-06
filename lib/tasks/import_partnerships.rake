require 'data_fixers/import_partnerships'

	namespace :clients do
		task :import_partnerships => :environment do
			DataFixers::ImportPartnerships.import!
		end
	end
