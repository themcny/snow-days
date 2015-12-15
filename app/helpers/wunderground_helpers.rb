helpers do
  def get_snow_day(state, city)
    w_obj = Wunderground.new
    hash_info = w_obj.forecast_for(state, city)
    return hash_info["forecast"]["simpleforecast"]["forecastday"][0]["snow_day"]["in"]
  end
end
