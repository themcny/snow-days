get '/messager' do
  andrew = User.find(1)
  t = TwilioMessager.new
  t.make_call({body:"SNOW NOW! SKI TIME BITCHES"})
end
