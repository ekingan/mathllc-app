namespace :clients do
  task :import_scorps => :environment do
    require 'data_fixers/import_scorps'
		DataFixers::ImportSCorps.import!
	end
end
