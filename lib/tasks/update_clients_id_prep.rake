require 'data_fixers/update_clients_id_prep'

	namespace :clients do
		task :update_clients => :environment do
			DataFixers::UpdateClientsIDPrep.import!
		end
	end
