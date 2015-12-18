get '/sessions' do
  # list sessions
  erb :'sessions/index'
end

get '/gotogoogle' do
 redirect "https://accounts.google.com/o/oauth2/auth?scope=email%20profile&state=b&redirect_uri=http://localhost:9393/oauthcallback&response_type=code&client_id=#{ENV["GOOGLE_CLIENT_ID"]}"
end

get '/oauthcallback' do
  p params
  body = {
    code: params[:code],
    client_id: ENV["GOOGLE_CLIENT_ID"],
    client_secret: ENV["GOOGLE_SECRET"],
    redirect_uri: "#{ENV['HOST']}/oauthcallback",
    grant_type: "authorization_code"
  }
  p body[:redirect_uri]
  post_repsonse = HTTParty.post("https://accounts.google.com/o/oauth2/token", body: body)
  me = HTTParty.get("https://www.googleapis.com/plus/v1/people/me?access_token=#{post_repsonse["access_token"]}")
  email = me.parsed_response["emails"].first
  email =email["value"]
  @user = User.find_by(email: email)
  session[:id]= @user.id
  redirect "/users/#{@user.id}"
end

post '/sessions' do
  # new session
  @user = User.find_by(email: params[:email])
  if @user.password == params[:password]
    session[:id] = @user.email
    redirect "/users/#{@user.id}"
  else
    erb :'sessions/new'
    @errors = ['username or password suckssss']
  end
  # redirect "/sessions/#{@session.id}"
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/sessions/:id' do
  # specific session should only work if you login
  erb :"/sessions/show"
end

get '/sessions/:id/edit' do
  # edit form
  erb :"/sessions/edit"
end

put 'sessions/:id' do
  # update session
  redirect "/sessions/#{params[:id]}"
end

