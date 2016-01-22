module SkiResortImporter
	def self.import(filename = File.dirname(__FILE__) + "ski-resorts.txt")
		txt_file = File.readlines("ski-resorts.txt")
		cities = []
		txt_file.each do |row|
			cities << row
		end
		return cities
	end
end

file = SkiResortImporter.import

def file_scrubber(file)
	file.each do |line|
		info_array = line.split(",")
		info_hash = {
			name: info_array[0],
			city: info_array[1],
			state: info_array[2],
		}
	end
end

file_scrubber(file)
