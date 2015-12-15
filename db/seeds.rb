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


snowmass = Resort.create!(name: 'Snowmass',
                      city: 'Snowmass',
                      state: 'CO',)

squaw = Resort.create!(name: 'Squaw Valley',
                       city: 'Olympic Village',
                       state: 'CA',)

park_city = Resort.create!(name: 'Park City',
                           city: 'Salt Lake City',
                           state: 'UT',)

big_sky = Resort.create!(name: 'Big Sky',
                         city: 'Big Sky',
                         state: 'MT',)
