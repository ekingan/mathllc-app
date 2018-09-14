namespace :clients do
  task :import_clients => :environment do
    require 'data_fixers/import_client_list'
		DataFixers::ImportClientList.import!
	end
end
