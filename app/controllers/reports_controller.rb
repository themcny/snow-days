get '/resorts/:resort_id/reports' do
  # list resorts/:resort_id/reports
  erb :'resorts/:resort_id/reports/index'
end

get '/resorts/:resort_id/reports/new' do
  # form for resorts/:resort_id/report
  erb :'resorts/:resort_id/reports/new'
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
