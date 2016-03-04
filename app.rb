require 'sinatra'
require 'net/http'
require 'json'
require 'htmlentities'

CHUCK_URL = "http://api.icndb.com/jokes/random"

get '/' do
	  "POST to /chuckme"
end

get '/chuckme' do
	uri = URI(CHUCK_URL)
	chuck_response = Net::HTTP.get(uri)
	chuck_data = JSON.parse(chuck_response)
	if chuck_data['type'] == 'success'
		return HTMLEntities.new.decode(chuck_data['value']['joke'])
	else
		return "EEK. Looks like Chuck roundhouse kicked this bot.  Something is wrong."
	end
end
