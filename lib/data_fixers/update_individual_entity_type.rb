module DataFixers
  class UpdateIndividualEntityTypes
    def self.update
			new.update
		end

		def update
			csv.each{|row| update_client row}
		end

		def csv
			file = 'CLIENTS_INDIVIDUAL'
			path = Rails.root.join('lib', 'data_fixers', 'data', "#{file}.csv")
			CSV.read(path, headers: true)
		end

    def tax_id(data)
			data["Taxpayer ID"].to_s[-4..-1].to_i if data["Taxpayer ID"]
		end

    def update_client(row)
			data = row.to_hash
			if c = Client.find_by_company(data['Taxpayer Name'].upcase)
				c.update(
					tax_id: tax_id(data),
					entity_type: :INDIVIDUAL
					)
				puts "UPDATED CLIENT #{c.company}"
			else
				puts "NO CLIENT BY THE NAME #{data['Taxpayer Name']}"
			end
    end
  end
end
