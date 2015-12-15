get '/users' do
  # list users
  erb :'users/index'
end

get '/users/new' do
  # form for user
  erb :'users/new'
end

post '/users' do
  # new user
  @user = User.new(email: params[:email],
                   phone: params[:phone],
                   name: params[:name],)
  @user.password=(params[:password])
  if @user.save
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
  end
  # redirect "/users/#{@user.id}"
end

get '/users/:id' do
  # specific user should only work if you login
  @user = User.find(params[:id])
  erb :"/users/show"
end

get '/users/:id/edit' do
  # edit form
  erb :"/users/edit"
end

put 'users/:id' do
  # update user
  redirect "/users/#{params[:id]}"
end

delete 'users/:id' do
  # delete user
  redirect '/users'
end
