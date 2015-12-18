get '/resorts' do
  # list resorts

  @cascades = []
  @sierras = []
  @ice_coast = []
  @rockies = []
  @other = []
  @resorts = Resort.all
  @resorts.each do |resort|
    if resort.state == 'CA' || resort.state == 'NV'
      @sierras << resort
    elsif resort.state == 'CO'
      @rockies << resort
    elsif resort.state == 'OR' || resort.state == 'WA'
      @cascades << resort
    elsif resort.state == 'MA' || resort.state == 'ME' || resort.state == 'CT' || resort.state == 'VT'
      @ice_coast << resort
    else
      @other << resort
    end
  end
  erb :'resorts/index'
end

get '/resorts/new' do
  # form for resort
  erb :'resorts/new'
end

post '/resorts' do
  # new resort
  redirect "/resorts"
  # redirect "/resorts/#{@resort.id}"
end

get '/resorts/:id' do
  # specific resort should only work if you login
  @resort = Resort.find(params[:id])
  erb :"/resorts/show"
end

get '/resorts/:id/edit' do
  # edit form
  erb :"/resorts/edit"
end

put '/resorts/:id' do
  # update resort
  redirect "/resorts/#{params[:id]}"
end

delete '/resorts/:id' do
  # delete resort
  redirect '/resorts'
end
