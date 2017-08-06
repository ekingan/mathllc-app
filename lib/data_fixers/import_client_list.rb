module DataFixers
	class ImportClientList

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

		def update_client(row)
			data = row.to_hash
			c = Client.create(
				first_name: data['Taxpayer First Name'].upcase,
				last_name: data['Taxpayer Last Name'].upcase,
				company: data['Taxpayer Name'].upcase,
				date_of_birth: parse_date(data['Taxpayer Date of Birth']),
				email: data['Taxpayer Email Address'],
				street: data['Street Address'],
				city: data['City'],
				state: data['State'],
				zip_code: data['ZIP Code'],
				occupation: data['Taxpayer Occupation'],
				filing_status: format_filing_status(data['Filing Status']),
				spouse_first_name: data['Spouse First Name'],
				spouse_last_name: data['Spouse Last Name'],
				spouse_date_of_birth: parse_date(data['Spouse Date of Birth']),
				spouse_occupation: data['Spouse Occupation'],
				tax_year_ends: parse_date(data['Year End']))
				puts "CREATED CLIENT #{c.last_name}"
		end

		def parse_date(string)
			Date.strptime(string.insert(-3, '19'), "%m/%d/%Y").to_time if string
		end

		def format_filing_status(status)
			(status.to_i - 1).to_i if status
		end

	end
end
