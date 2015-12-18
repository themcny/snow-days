# snowmass = Resort.create!(name: 'Snowmass',
#                       city: 'Snowmass',
#                       state: 'CO',)

# squaw = Resort.create!(name: 'Squaw Valley',
#                        city: 'Olympic Village',
#                        state: 'CA',)

# park_city = Resort.create!(name: 'Park City',
#                            city: 'Salt Lake City',
#                            state: 'UT',)

# big_sky = Resort.create!(name: 'Big Sky',
#                          city: 'Big Sky',
#                          state: 'MT',)

module SkiResortImporter
  def self.import(filename = File.dirname(__FILE__) + "ski-resorts.txt")
    txt_file = File.readlines("db/ski-resorts.txt")
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
    Resort.create!(info_hash)
  end
end

file_scrubber(file)
