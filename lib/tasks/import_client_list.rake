require 'data_fixers/import_client_list'

	namespace :clients do
		task :import_clients => :environment do
			DataFixers::ImportClientList.import!
		end
	end
