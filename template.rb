require 'sinatra'
require 'pony' # nice simple emails

get '/' do
  erb :index
end

get '/band' do
  erb :ticket
end

get '/tour' do
  erb :tour
end

get '/contact' do
  erb :contact
end

post '/contact' do
  Pony.email(to: "my_email@domain.com",
             from:          params[:email],
             subject:       "You got a new message from #{params[:name]}",
             body:          params[:message],
             via:           :smtp,
             via_options: {
             address:        'smtp.gmail.com',
             port:           '587',
             user_name:      'answerawesome',
             password:       'Sup3r$ecret',
             authentication: :plain, # :plain, :login, :cram_md5, no auth by default
             domain:         "domain.com" # the HELO domain provided by the client to the server
    }
  )
  "Thank you #{params[:name]} for contacting us"
end

not_found do
  halt 404, 'page not found'
  # erb :not_found, layout: :error
end
