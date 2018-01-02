require 'data_fixers/update_s_corps'
	namespace :clients do
		task :update_s_corps => :environment do
			DataFixers::UpdateSCorps.update
		end
	end
