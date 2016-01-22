andrew = User.new(name: 'Andrew Blum',
                   email: 'andrew.blum@gmail.com',
                   phone: '9176565956',)

andrew.password=('andrew')
andrew.save

nicole = User.new(name: 'Nicole Yee',
                   email: 'n.lindsey.yee@gmail.com',
                   phone: '5109821720',)
nicole.password=('1234')
nicole.save

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
      region: info_array[4].chomp,
    }
    Resort.create!(info_hash)
  end
end

file_scrubber(file)
