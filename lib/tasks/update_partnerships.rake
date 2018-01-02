require 'data_fixers/update_partnerships'
	namespace :clients do
		task :update_partnerships => :environment do
			DataFixers::UpdatePartnerships.update
		end
	end
