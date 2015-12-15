get '/resorts/:resort_id/reports' do
  # list resorts/:resort_id/reports
  erb :'resorts/:resort_id/reports/index'
end

get '/resorts/:resort_id/reports/new' do
  # create new wunderground object
  @resort = Resort.find(params[:resort_id])
  city = @resort.city
  if city.include?(' ')
    city = city.tr!(' ', '_')
  end

  current_time = Time.now.utc
  within = current_time - 24.hours

  case @resort.current_report
  when nil
    puts "check nil"
    @snow_data_in = get_snow_data(@resort.state, city)
    Report.create!(@snow_data_in,
                   resort_id: @resort.id,)
    @snow_data_in
  when @resort.current_report.updated_at > within
    puts "check time"
    @snow_data_in = get_snow_data(@resort.state, city)
    Report.create!(@snow_data_in,
                   resort_id: @resort.id,)
  else
    puts "ELSE"
    @snow_data_in = @resort.current_report.snow_day
    # Report.find_by(resort_id: params[:resort_id])
  end

  if @resort.current_report && @resort.current_report.updated_at > within
    @snow_data_in = get_snow_data(@resort.state, city)
    if @snow_data_in == nil
      @snow_data_in = -1
    end
  else
    @snow_data_in = @resort.current_report.snow_day
  end
  # form for resorts/:resort_id/report
  erb :'reports/new'
end

post '/resorts/:resort_id/reports' do
  # new resorts/:resort_id/report
  redirect "/resorts/:resort_id/reports"
  # redirect "/resorts/:resort_id/reports/#{@resorts/:resort_id/report.id}"
end

get '/resorts/:resort_id/reports/:id' do
  # specific resorts/:resort_id/report should only work if you login
  erb :"/resorts/:resort_id/reports/show"
end

get '/resorts/:resort_id/reports/:id/edit' do
  # edit form
  erb :"/resorts/:resort_id/reports/edit"
end

put '/resorts/:resort_id/reports/:id' do
  # update resorts/:resort_id/report
  redirect "/resorts/:resort_id/reports/#{params[:id]}"
end

delete '/resorts/:resort_id/reports/:id' do
  # delete resorts/:resort_id/report
  redirect '/resorts/:resort_id/reports'
end
