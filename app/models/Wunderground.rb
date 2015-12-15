class Wunderground
  include HTTParty
  base_uri 'api.wunderground.com/api'

  # def initialize(service, page)
  #   @options = { query: {site: service, page: page}}
  # end

  def forecast(state, city)
    self.class.get(ENV['WEATHER_API_KEY'] + "/forecast/q/#{state}/#{city}.json")
  end
end
