module DataFixers
	class UpdateClientsIDPrep

		def self.import!
			new.import!
		end

		def import!
			csv.each{|row| update_client row}
		end

		def csv
			file = 'CLIENTS'
			path = Rails.root.join('lib', 'data_fixers', 'data', "#{file}.csv")
			CSV.read(path, headers: true)
		end

		def tax_id(data)
			data["Taxpayer ID"].to_s[-4..-1].to_i if data["Taxpayer ID"]
		end

    def format_name(name)
      name.upcase unless name.nil?
    end

		def update_client(row)
			data = row.to_hash
			if c = Client.find_by_company(data['Taxpayer Name'].upcase)
				c.update(
					tax_id: tax_id(data),
					primary_preparer_id: data["Preparer Number"],
					first_name: format_name(data['Taxpayer First Name']),
					last_name: format_name(data['Taxpayer Last Name']),
					company: format_name(data['Taxpayer Name'])
					)
				puts "UPDATED CLIENT #{c.last_name}"
			else
				puts "NO CLIENT BY THE NAME #{data['Taxpayer Last Name']}"
			end
		end
	end
end
