require 'data_fixers/update_individual_entity_type'
	namespace :clients do
		task :update_individuals => :environment do
			DataFixers::UpdateIndividualEntityTypes.update
		end
	end
