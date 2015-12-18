helpers do
  def get_snow_data(state, city)
    w_obj = Wunderground.new
    hash_info = w_obj.forecast_for(state, city)
    snow_data_hash = {
      snow_day: hash_info["forecast"]["simpleforecast"]["forecastday"][0]["snow_day"]["in"],
      snow_allday: hash_info["forecast"]["simpleforecast"]["forecastday"][0]["snow_allday"]["in"],
      snow_night: hash_info["forecast"]["simpleforecast"]["forecastday"][0]["snow_night"]["in"],
    }
    return snow_data_hash
  end
end
