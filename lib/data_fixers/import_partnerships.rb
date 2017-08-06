module DataFixers
	class ImportPartnerships

		def self.import!
			new.import!
		end

		def import!
			csv.each{|row| update_client row}
		end

		def csv
			file = 'BUSINESS_1065'
			path = Rails.root.join('lib', 'data_fixers', 'data', "#{file}.csv")
			CSV.read(path, headers: true)
		end

		def update_client(row)
			data = row.to_hash
			c = Client.create(
				last_name: data['Taxpayer Name'].upcase,
				company: data['Taxpayer Name'].upcase,
				email: email(data),
				street: data['Street Address'],
				city: data['City'],
				state: data['State'],
				zip_code: data['ZIP Code'],
				tax_id: tax_id(data),
				primary_preparer_id: data['Preparer Number'],
				entity_type: :PARTNERSHIP,
				tax_year_ends: parse_date(data['Year End']))
			c.save!(:validate => false)
			puts "CREATED CLIENT #{c.last_name}" if c.valid?
		end

		def parse_date(string)
			Date.strptime(string.insert(-3, '19'), "%m/%d/%Y").to_time if string
		end

		def tax_id(data)
			data["Taxpayer ID"].to_s[-4..-1].to_i
		end

		def email(data)
			data['Email Address'] || "get@email.com"
		end

	end
end
