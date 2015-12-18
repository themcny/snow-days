get '/' do
  if session.has_key?(:credentials)
    erb :logged_in
  else
    erb :index
  end
end
