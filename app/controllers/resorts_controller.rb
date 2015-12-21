get '/resorts' do
  # list resorts
  @cascades = []
  @sierras = []
  @wasatch = []
  @ice_coast = []
  @rockies = []
  @midwest = []
  @tetons = []
  @other = []
  @resorts = Resort.all
  @resorts.each do |resort|
    if resort.region == 'Sierras'
      @sierras << resort
    elsif resort.region == 'Rockies'
      @rockies << resort
    elsif resort.region == 'Cascades'
      @cascades << resort
    elsif resort.region == 'East Coast'
      @ice_coast << resort
    elsif resort.region == 'Tetons'
      @tetons << resort
    elsif resort.region == 'Wasatch'
      @wasatch << resort
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
  @favorite = Favorite.find_by(user_id: session[:id], resort_id: @resort.id)

  if session[:id]
    @user = User.find(session[:id])
  end
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
