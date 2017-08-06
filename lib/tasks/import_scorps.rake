require 'data_fixers/import_scorps'

	namespace :clients do
		task :import_scorps => :environment do
			DataFixers::ImportSCorps.import!
		end
	end
