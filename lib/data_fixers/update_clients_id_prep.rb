module DataFixers
	class UpdateClientsIDPrep

		def self.import!
			new.import!
		end

		def import!
			csv.each{|row| update_client row}
		end

		def csv
			file = 'CLIENTS_ALL'
			path = Rails.root.join('lib', 'data_fixers', 'data', "#{file}.csv")
			CSV.read(path, headers: true)
		end

		def tax_id(data)
			data["Taxpayer ID"].to_s[-4..-1].to_i
		end

		def update_client(row)
			data = row.to_hash
			if c = Client.find_by_last_name(data['Taxpayer Last Name'])
				c.update_attributes(
					tax_id: tax_id(data),
					primary_preparer_id: data["Preparer Number"],
					first_name: c.first_name.upcase,
					last_name: c.last_name.upcase,
					company: c.company.upcase,
					entity_type: :INDIVIDUAL
					)
				puts "UPDATED CLIENT #{c.last_name}"
			else
				puts "NO CLIENT BY THE NAME #{data['Taxpayer Last Name']}"
			end
		end
	end
end
