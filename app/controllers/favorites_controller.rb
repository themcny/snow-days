get '/users/:user_id/favorites' do
  # list favorites
  @user = User.find(params[:user_id])
  @favorite_resorts = []
  @user.favorites.each do |favorite|
    @favorite_resorts << Resort.find(favorite.resort_id)
  end
  puts @favorite_resorts.class
  erb :'favorites/index'
end

get '/users/:user_id/favorites/new' do
  # form for favorite
  @user = User.find(params[:user_id])
  @resorts = Resort.all
  erb :'favorites/new'
end

post '/users/:user_id/favorites' do
  # new favorite
  Favorite.create!(user_id: params[:user_id],
                   resort_id: params[:resort_id])
  redirect "/users/#{params[:user_id]}/favorites"
  # redirect "/favorites/#{@favorite.id}"
end

get '/users/:user_id/favorites/:id' do
  # specific favorite should only work if you login
  erb :"/favorites/show"
end

get '/users/:user_id/favorites/:id/edit' do
  # edit form
  erb :"/favorites/edit"
end

put '/users/:user_id/favorites/:id' do
  # update favorite
  redirect "/favorites/#{params[:id]}"
end

delete '/users/:user_id/favorites/:id' do
  # delete favorite
  redirect '/favorites'
end
