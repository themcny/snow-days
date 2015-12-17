require 'twilio-ruby'
class TwilioMessager
  attr_reader :client

  def initialize
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def make_call(options = {})
    @client.messages.create(
      body: "WE LOVE YOU",
      from: "+14156530538",
      to: "+19176565956"
      )
  end
end

